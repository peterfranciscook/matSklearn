classdef DBSCAN < sklearnCluster
% MATLAB wrapper for sklearn.cluster.DBSCAN()
% Peter Cook 2018
%
% Type:        DBSCAN
% String form:
% DBSCAN(algorithm='auto', eps=0.5, leaf_size=30, metric='euclidean',
%     min_samples=5, n_jobs=1, p=None)
% Docstring:  
% Perform DBSCAN clustering from vector array or distance matrix.
% 
% DBSCAN - Density-Based Spatial Clustering of Applications with Noise.
% Finds core samples of high density and expands clusters from them.
% Good for data which contains clusters of similar density.
% 
% Read more in the :ref:`User Guide <dbscan>`.
% 
% Parameters
% ----------
% eps : float, optional
%     The maximum distance between two samples for them to be considered
%     as in the same neighborhood.
% 
% min_samples : int, optional
%     The number of samples (or total weight) in a neighborhood for a point
%     to be considered as a core point. This includes the point itself.
% 
% metric : string, or callable
%     The metric to use when calculating distance between instances in a
%     feature array. If metric is a string or callable, it must be one of
%     the options allowed by metrics.pairwise.calculate_distance for its
%     metric parameter.
%     If metric is "precomputed", X is assumed to be a distance matrix and
%     must be square. X may be a sparse matrix, in which case only "nonzero"
%     elements may be considered neighbors for DBSCAN.
% 
%     .. versionadded:: 0.17
%        metric *precomputed* to accept precomputed sparse matrix.
% 
% algorithm : {'auto', 'ball_tree', 'kd_tree', 'brute'}, optional
%     The algorithm to be used by the NearestNeighbors module
%     to compute pointwise distances and find nearest neighbors.
%     See NearestNeighbors module documentation for details.
% 
% leaf_size : int, optional (default = 30)
%     Leaf size passed to BallTree or cKDTree. This can affect the speed
%     of the construction and query, as well as the memory required
%     to store the tree. The optimal value depends
%     on the nature of the problem.
% 
% p : float, optional
%     The power of the Minkowski metric to be used to calculate distance
%     between points.
% 
% n_jobs : int, optional (default = 1)
%     The number of parallel jobs to run.
%     If ``-1``, then the number of jobs is set to the number of CPU cores.
% 
% Attributes
% ----------
% core_sample_indices_ : array, shape = [n_core_samples]
%     Indices of core samples.
% 
% components_ : array, shape = [n_core_samples, n_features]
%     Copy of each core sample found by training.
% 
% labels_ : array, shape = [n_samples]
%     Cluster labels for each point in the dataset given to fit().
%     Noisy samples are given the label -1.
% 
% Notes
% -----
% See examples/cluster/plot_dbscan.py for an example.
% 
% This implementation bulk-computes all neighborhood queries, which increases
% the memory complexity to O(n.d) where d is the average number of neighbors,
% while original DBSCAN had memory complexity O(n).
% 
% Sparse neighborhoods can be precomputed using
% :func:`NearestNeighbors.radius_neighbors_graph
% <sklearn.neighbors.NearestNeighbors.radius_neighbors_graph>`
% with ``mode='distance'``.
% 
% References
% ----------
% Ester, M., H. P. Kriegel, J. Sander, and X. Xu, "A Density-Based
% Algorithm for Discovering Clusters in Large Spatial Databases with Noise".
% In: Proceedings of the 2nd International Conference on Knowledge Discovery
% and Data Mining, Portland, OR, AAAI Press, pp. 226-231. 1996

    properties
        n_jobs = 1
        algorithm = 'auto'
        metric = 'euclidean'
        eps = 0.5
        p = py.None
        leaf_size = 30
        min_samples = 5
    end
    
    methods
        
        function hObj = DBSCAN
            hObj@sklearnCluster('DBSCAN')
        end
        
        function set.n_jobs(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.n_jobs = int16(x);
                hObj.n_jobs = int16(x);
            end
        end
        
        function set.algorithm(hObj,x)
            if ischar(x) && ismember(x,{'auto', 'ball_tree', 'kd_tree', 'brute'})
                hObj.pyCluster.algorithm = x;
                hObj.algorithm = x;
            end
        end
        
        function set.metric(hObj,x)
            if ischar(x) && ismember(x,{'cityblock','cosine','euclidean','l1','l2','manhattan'})
                hObj.pyCluster.metric = x;
                hObj.metric = x;
            end
        end
        
        function set.eps(hObj,x)
            if isfloat(x) && x>0
                hObj.pyCluster.eps = x;
                hObj.eps = x;
            end
        end
        
        function set.p(hObj,x)
            if isfloat(x) && x>0
                hObj.pyCluster.p = x;
                hObj.p = x;
            end
        end
        
        function set.leaf_size(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.leaf_size = int16(x);
                hObj.leaf_size = int16(x);
            end
        end
        
        function set.min_samples(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.min_samples = int16(x);
                hObj.min_samples = int16(x);
            end
        end
        
    end
    
    
    
end
