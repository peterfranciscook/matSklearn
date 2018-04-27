classdef Birch < sklearnCluster
% MATLAB wrapper for sklearn.cluster.Birch()
% Peter Cook 2018
%
% Type:        Birch
% String form:
% Birch(branching_factor=50, compute_labels=True, copy=True, n_clusters=3,
%    threshold=0.5)
% Docstring:  
% Implements the Birch clustering algorithm.
% 
% Every new sample is inserted into the root of the Clustering Feature
% Tree. It is then clubbed together with the subcluster that has the
% centroid closest to the new sample. This is done recursively till it
% ends up at the subcluster of the leaf of the tree has the closest centroid.
% 
% Read more in the :ref:`User Guide <birch>`.
% 
% Parameters
% ----------
% threshold : float, default 0.5
%     The radius of the subcluster obtained by merging a new sample and the
%     closest subcluster should be lesser than the threshold. Otherwise a new
%     subcluster is started.
% 
% branching_factor : int, default 50
%     Maximum number of CF subclusters in each node. If a new samples enters
%     such that the number of subclusters exceed the branching_factor then
%     the node has to be split. The corresponding parent also has to be
%     split and if the number of subclusters in the parent is greater than
%     the branching factor, then it has to be split recursively.
% 
% n_clusters : int, instance of sklearn.cluster model, default 3
%     Number of clusters after the final clustering step, which treats the
%     subclusters from the leaves as new samples. If None, this final
%     clustering step is not performed and the subclusters are returned
%     as they are. If a model is provided, the model is fit treating
%     the subclusters as new samples and the initial data is mapped to the
%     label of the closest subcluster. If an int is provided, the model
%     fit is AgglomerativeClustering with n_clusters set to the int.
% 
% compute_labels : bool, default True
%     Whether or not to compute labels for each fit.
% 
% copy : bool, default True
%     Whether or not to make a copy of the given data. If set to False,
%     the initial data will be overwritten.
% 
% Attributes
% ----------
% root_ : _CFNode
%     Root of the CFTree.
% 
% dummy_leaf_ : _CFNode
%     Start pointer to all the leaves.
% 
% subcluster_centers_ : ndarray,
%     Centroids of all subclusters read directly from the leaves.
% 
% subcluster_labels_ : ndarray,
%     Labels assigned to the centroids of the subclusters after
%     they are clustered globally.
% 
% labels_ : ndarray, shape (n_samples,)
%     Array of labels assigned to the input data.
%     if partial_fit is used instead of fit, they are assigned to the
%     last batch of data.
% 
% Examples
% --------
% from sklearn.cluster import Birch
% X = [[0, 1], [0.3, 1], [-0.3, 1], [0, -1], [0.3, -1], [-0.3, -1]]
% brc = Birch(branching_factor=50, n_clusters=None, threshold=0.5,
% compute_labels=True)
% brc.fit(X)
% Birch(branching_factor=50, compute_labels=True, copy=True, n_clusters=None,
%    threshold=0.5)
% brc.predict(X)
% array([0, 0, 0, 1, 1, 1])
% 
% References
% ----------
% * Tian Zhang, Raghu Ramakrishnan, Maron Livny
%   BIRCH: An efficient data clustering method for large databases.
%   http://www.cs.sfu.ca/CourseCentral/459/han/papers/zhang96.pdf
% 
% * Roberto Perdisci
%   JBirch - Java implementation of BIRCH clustering algorithm
%   https://code.google.com/archive/p/jbirch

    properties
        threshold = 0.5
        branching_factor = 50
        copy = true
        compute_labels = true
        n_clusters = 3
    end
    
    methods
        
        function hObj = Birch
            hObj@sklearnCluster('Birch')
        end
        
        function set.threshold(hObj,x)
            if isfloat(x) && x>0
                hObj.pyCluster.threshold = x;
                hObj.threshold = x;
            end
        end
        
        function set.branching_factor(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.branching_factor = int16(x);
                hObj.branching_factor = int16(x);
            end
        end
        
        function set.copy(hObj,x)
            if islogical(x)
                hObj.pyCluster.copy = x;
                hObj.copy = x;
            end
        end
        
        function set.compute_labels(hObj,x)
            if islogical(x)
                hObj.pyCluster.compute_labels = x;
                hObj.compute_labels = x;
            end
        end
        
        function set.n_clusters(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.n_clusters = int16(x);
                hObj.n_clusters = int16(x);
            end
        end
        
    end
    
end
