# matSklearn
MATLAB Wrapper for the Python Machine Learning Library scikit-learn (https://github.com/scikit-learn/scikit-learn)

## Required Packages
In order to use this library, you will need:
1. MATLAB. I wrote & tested this in version R2016b, it is my assumption this will work in any version of MATLAB that supports calling python libraries. A quick check for this would be to see if the command `which py` returns a valid path. 
2. Python. I wrote & tested this with Python 2.7, you can check (or change) which version your MATLAB is running with the command `pyversion`. I don't think there's any reason this shouldn't work with Python 3.x, but I just haven't tested it myself. If you need help getting Python & MATLAB working together, [this Mathworks page](https://www.mathworks.com/help/matlab/getting-started-with-python.html) will get you up to speed. 
3. Python libraries: numpy, scipy, & scikit-learn. If you don't already have all 3 of these, the easiest thing to do would be to install a product like [Anaconda](https://www.anaconda.com/download/). 

## Getting Started
1. After you clone the repository, add the matSklearn directory to your MATLAB path using `addpath` or `pathtool`. 
2. It's possible (but unlikely) that MATLAB found your scikit-learn directory. Try something like this (Windows):
```
USERPROFILE = regexprep(getenv('USERPROFILE'),'\\','\\\');
PYPACKAGEPATH = strcat(USERPROFILE,'\\AppData\\Local\\Continuum\\Anaconda3\\envs\\py27\\Lib\\site-packages')
if count(py.sys.path,PYPACKAGEPATH) == 0
    insert(py.sys.path,int32(0),PYPACKAGEPATH);
end
```
Note your `PYPACKAGEPATH` may be different depending on what version of Python you are using, if you are using a Python IDE other than Anaconda, etc. It's the path to the directory where where pypi or conda put sklearn. 

## Using matSklearn
For now, only the cluster module has been wrapped. You can see some examples of basic use on a toy dataset in the `sklearnClusterUTest` m-file. 

## TODO
I will add a folder for each additional module as they are written. I guess this gives me a hefty #TODO list:

~~sklearn.cluster~~

```
sklearn.calibration
sklearn.cluster.bicluster
sklearn.covariance
sklearn.cross_decomposition
sklearn.datasets
sklearn.decomposition
sklearn.discriminant_analysis
sklearn.dummy
sklearn.ensemble
sklearn.feature_extraction
sklearn.feature_selection
sklearn.gaussian_process
sklearn.isotonic
sklearn.kernel_approximation
sklearn.kernel_ridge
sklearn.linear_model
sklearn.manifold
sklearn.metrics
sklearn.mixture
sklearn.model_selection
sklearn.multiclass
sklearn.multioutput
sklearn.naive_bayes
sklearn.neighbors
sklearn.neural_network
sklearn.pipeline
sklearn.preprocessing
sklearn.random_projection
sklearn.semi_supervised
sklearn.svm
sklearn.tree
sklearn.utilities
```
I automated the writing of most of the subclass wrappers using a python script (maybe 90% of the writing?). Here's an example:
```
from sklearn import cluster
import inspect
import re
import networkx as nx


clusterDict = cluster.__dict__
dk = clusterDict.keys()
flavors = filter(lambda k:isinstance(d[k],type),dk)
clusterDict = {}

G = nx.graph.Graph()
G.add_node("sklearn.cluster")
G.add_nodes_from(flavors)

for flavor in flavors:
    G.add_edge("sklearn.cluster",flavor)
    clusterString = "cluster."+flavor+"()"
    print clusterString
    clusterObject = eval(clusterString)
    
    D = dir(clusterObject)
    dictKeys = clusterObject.__dict__.keys()
    D = [d for d in D if d not in dictKeys]
    D = [d for d in D if not re.search('^_+|_+$',d)]
    
    print("\n")
    print(clusterObject.__class__)
    print("\nArgs/Varargs/Kwargs:\n")
    print(inspect.getargspec(clusterObject.__class__.__init__))
    print("\nProperties:\n")
    print(clusterObject.__dict__)
    print("\nMethods:\n")
    print(D)
    print("\n")
    
    clusterObjectDict = {}
    clusterObjectDict['properties'] = clusterObject.__dict__
    clusterObjectDict['methods'] = D
    clusterDict[clusterString] = clusterObjectDict
    
    K = clusterObject.__dict__.keys()
    G.add_nodes_from(K)
    G.add_nodes_from(D)
    for k in K:
        G.add_edge(flavor,k)
    for d in D:
        G.add_edge(flavor,d)

gDegree = G.degree()
nodeList=[k for k in gDegree.iterkeys() if gDegree[k]>2]
#nx.draw_networkx(G,nodelist=nodeList)
nx.draw_networkx(G)

prog = re.compile('(?<=type \')[^\'>]+|(?<=class \')[^\'>]+')
for k1 in clusterDict.iterkeys():
    errMsg = ""
    fptr = open(k1[:-2]+".m",'w')
    fptr.write("classdef "+k1[8:-2]+" < sklearnCluster\n\n")
    fptr.write("% MATLAB wrapper for sklearn."+k1+"\n")
    fptr.write("% Peter Cook 2018\n\n")
    #write class properties
    fptr.write("properties\n")
    for k2 in clusterDict[k1]['properties'].iterkeys():
        #check class of arg/kwarg
        argClass = str(type(clusterDict[k1]['properties'][k2]))
        m = prog.search(argClass)
        argClass = m.group(0)
        argValue = str(clusterDict[k1]['properties'][k2])
        
        if argClass == 'int':
            fptr.write("\t"+k2+" = "+str(argValue)+"\n")
        elif argClass == 'str':
            fptr.write("\t"+k2+" = '"+argValue+"'\n")
        elif argClass == 'float':
            fptr.write("\t"+k2+" = "+str(argValue)+"\n")
        elif argClass == 'bool':
            fptr.write("\t"+k2+" = "+str(argValue).lower()+"\n")
        elif argClass == 'NoneType':
            fptr.write("\t"+k2+" = "+"py.None\n")
        else:
            fptr.write("\t"+k2+" = "+str(argValue)+"\n")
    #end properties
    fptr.write("end\n\n")
    
    #write class methods
    fptr.write("methods\n\n")
    #write class constructor
    fptr.write("function hObj = "+k1[8:-2]+"\n")
    fptr.write("\thObj@sklearnCluster("+k1[8:-2]+")\n")
    fptr.write("end\n\n")
    #write class set methods
    for k2 in clusterDict[k1]['properties'].iterkeys():
        #check class of arg/kwarg
        argClass = str(type(clusterDict[k1]['properties'][k2]))
        m = prog.search(argClass)
        argClass = m.group(0)
        fptr.write("function set."+k2+"(hObj,x)\n")
        if argClass == 'int':
            fptr.write("\tif isnumeric(x) && x>0\n")
            fptr.write("\t\thObj.pyCluster."+k2+" = int16(x);\n")
            fptr.write("\t\thObj."+k2+" = int16(x);\n")

        elif argClass == 'str':
            fptr.write("\tif ischar(x) && any(ismember(x,{}))\n")
            fptr.write("\t\thObj.pyCluster."+k2+" = x;\n")
            fptr.write("\t\thObj."+k2+" = x;\n")
            fptr.write("\t\tCHECK KWARGS\n")
            print("Check kwargs for "+k1+"."+k2)
            errMsg = errMsg+"%Check kwargs for "+k1+"."+k2+"\n"

        elif argClass == 'float':
            fptr.write("\tif isfloat(x) && x>0\n")
            fptr.write("\t\thObj.pyCluster."+k2+" = x;\n")
            fptr.write("\t\thObj."+k2+" = x;\n")

        elif argClass == 'bool':
            fptr.write("\tif islogical(x)\n")
            fptr.write("\t\thObj.pyCluster."+k2+" = x;\n")
            fptr.write("\t\thObj."+k2+" = x;\n")

        elif argClass == 'NoneType':
            fptr.write("\tif isa(x,'py.None')\n")
            fptr.write("\t\tCHECK KWARGS\n")
            print("Check kwargs for "+k1+"."+k2)
            errMsg = errMsg+"%Check kwargs for "+k1+"."+k2+"\n"

        else:
            fptr.write("\tif isa(x,"+argClass+")\n")
            fptr.write("\t\thObj.pyCluster."+k2+" = x;\n")
            fptr.write("\t\thObj."+k2+" = x;\n")
            fptr.write("\t\tCHECK KWARGS\n")
            print("Check kwargs for "+k1+"."+k2)
            errMsg = errMsg+"%Check kwargs for "+k1+"."+k2+"\n"
        
        #end if
        fptr.write("\tend\n")
        #end function
        fptr.write("end"+"\n\n")
    #end methods
    fptr.write("end\n\n")
    #end classdef
    fptr.write(errMsg)
    fptr.write("end\n")
    fptr.close()
```

