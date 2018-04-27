classdef AffinityPropagation < sklearnCluster
% MATLAB wrapper for sklearn.cluster.AffinityPropagation()
% Peter Cook 2018
%
% Type:        AffinityPropagation
% String form:
% AffinityPropagation(affinity='euclidean', convergence_iter=15, copy=True,
%           damping=0.5, max_iter=200, preference=None, verbose=False)
% Docstring:  
% Perform Affinity Propagation Clustering of data.
% 
% Read more in the :ref:`User Guide <affinity_propagation>`.
% 
% Parameters
% ----------
% damping : float, optional, default: 0.5
%     Damping factor between 0.5 and 1.
% 
% convergence_iter : int, optional, default: 15
%     Number of iterations with no change in the number
%     of estimated clusters that stops the convergence.
% 
% max_iter : int, optional, default: 200
%     Maximum number of iterations.
% 
% copy : boolean, optional, default: True
%     Make a copy of input data.
% 
% preference : array-like, shape (n_samples,) or float, optional
%     Preferences for each point - points with larger values of
%     preferences are more likely to be chosen as exemplars. The number
%     of exemplars, ie of clusters, is influenced by the input
%     preferences value. If the preferences are not passed as arguments,
%     they will be set to the median of the input similarities.
% 
% affinity : string, optional, default=``euclidean``
%     Which affinity to use. At the moment ``precomputed`` and
%     ``euclidean`` are supported. ``euclidean`` uses the
%     negative squared euclidean distance between points.
% 
% verbose : boolean, optional, default: False
%     Whether to be verbose.
% 
% 
% Attributes
% ----------
% cluster_centers_indices_ : array, shape (n_clusters,)
%     Indices of cluster centers
% 
% cluster_centers_ : array, shape (n_clusters, n_features)
%     Cluster centers (if affinity != ``precomputed``).
% 
% labels_ : array, shape (n_samples,)
%     Labels of each point
% 
% affinity_matrix_ : array, shape (n_samples, n_samples)
%     Stores the affinity matrix used in ``fit``.
% 
% n_iter_ : int
%     Number of iterations taken to converge.
% 
% Notes
% -----
% See examples/cluster/plot_affinity_propagation.py for an example.
% 
% The algorithmic complexity of affinity propagation is quadratic
% in the number of points.
% 
% References
% ----------
% 
% Brendan J. Frey and Delbert Dueck, "Clustering by Passing Messages
% Between Data Points", Science Feb. 2007

    properties
        verbose = false
        max_iter = 200
        affinity = 'euclidean'
        damping = 0.5
        copy = true
        convergence_iter = 15
        preference = py.None
    end
    
    methods
        
        function hObj = AffinityPropagation
            hObj@sklearnCluster('AffinityPropagation')
        end
        
        function set.verbose(hObj,x)
            if islogical(x)
                hObj.pyCluster.verbose = x;
                hObj.verbose = x;
            end
        end
        
        function set.max_iter(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.max_iter = int16(x);
                hObj.max_iter = int16(x);
            end
        end
        
        function set.affinity(hObj,x)
            if ischar(x) && ismember(x,{'euclidean','precomputed'})
                hObj.pyCluster.affinity = x;
                hObj.affinity = x;
            end
        end
        
        function set.damping(hObj,x)
            if isfloat(x) && x>0
                hObj.pyCluster.damping = x;
                hObj.damping = x;
            end
        end
        
        function set.copy(hObj,x)
            if islogical(x)
                hObj.pyCluster.copy = x;
                hObj.copy = x;
            end
        end
        
        function set.convergence_iter(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.convergence_iter = int16(x);
                hObj.convergence_iter = int16(x);
            end
        end
        
        function set.preference(hObj,x)
            if isnumeric(x) && length(x)==1
                hObj.pyCluster.preference = x;
                hObj.preference = x;
            elseif isnumeric(x) && length(x)>1
                %TODO: error check to make sure length of array matches length of
                %the array passed to hObj.fit_predict
                hObj.pyCluster.preference = x;
                hObj.preference = x;
            end
        end
        
    end
    
    
    
    
end
