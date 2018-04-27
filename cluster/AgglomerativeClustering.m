classdef AgglomerativeClustering < sklearnCluster
% MATLAB wrapper for sklearn.cluster.AgglomerativeClustering()
% Peter Cook 2018
%
% Type:        AgglomerativeClustering
% String form:
% AgglomerativeClustering(affinity='euclidean', compute_full_tree='auto',
%            connectivity= <...> ory(cachedir=None), n_clusters=2,
%            pooling_func=<function mean at 0x0000000002715518>)
% Docstring:  
% Agglomerative Clustering
% 
% Recursively merges the pair of clusters that minimally increases
% a given linkage distance.
% 
% Read more in the :ref:`User Guide <hierarchical_clustering>`.
% 
% Parameters
% ----------
% n_clusters : int, default=2
%     The number of clusters to find.
% 
% connectivity : array-like or callable, optional
%     Connectivity matrix. Defines for each sample the neighboring
%     samples following a given structure of the data.
%     This can be a connectivity matrix itself or a callable that transforms
%     the data into a connectivity matrix, such as derived from
%     kneighbors_graph. Default is None, i.e, the
%     hierarchical clustering algorithm is unstructured.
% 
% affinity : string or callable, default: "euclidean"
%     Metric used to compute the linkage. Can be "euclidean", "l1", "l2",
%     "manhattan", "cosine", or 'precomputed'.
%     If linkage is "ward", only "euclidean" is accepted.
% 
% memory : Instance of joblib.Memory or string (optional)
%     Used to cache the output of the computation of the tree.
%     By default, no caching is done. If a string is given, it is the
%     path to the caching directory.
% 
% compute_full_tree : bool or 'auto' (optional)
%     Stop early the construction of the tree at n_clusters. This is
%     useful to decrease computation time if the number of clusters is
%     not small compared to the number of samples. This option is
%     useful only when specifying a connectivity matrix. Note also that
%     when varying the number of clusters and using caching, it may
%     be advantageous to compute the full tree.
% 
% linkage : {"ward", "complete", "average"}, optional, default: "ward"
%     Which linkage criterion to use. The linkage criterion determines which
%     distance to use between sets of observation. The algorithm will merge
%     the pairs of cluster that minimize this criterion.
% 
%     - ward minimizes the variance of the clusters being merged.
%     - average uses the average of the distances of each observation of
%       the two sets.
%     - complete or maximum linkage uses the maximum distances between
%       all observations of the two sets.
% 
% pooling_func : callable, default=np.mean
%     This combines the values of agglomerated features into a single
%     value, and should accept an array of shape [M, N] and the keyword
%     argument ``axis=1``, and reduce it to an array of size [M].
% 
% Attributes
% ----------
% labels_ : array [n_samples]
%     cluster labels for each point
% 
% n_leaves_ : int
%     Number of leaves in the hierarchical tree.
% 
% n_components_ : int
%     The estimated number of connected components in the graph.
% 
% children_ : array-like, shape (n_nodes-1, 2)
%     The children of each non-leaf node. Values less than `n_samples`
%     correspond to leaves of the tree which are the original samples.
%     A node `i` greater than or equal to `n_samples` is a non-leaf
%     node and has children `children_[i - n_samples]`. Alternatively
%     at the i-th iteration, children[i][0] and children[i][1]
%     are merged to form node `n_samples + i`

    properties
        compute_full_tree = 'auto'
        n_clusters = 2
        connectivity = py.None
        affinity = 'euclidean'
        memory
        pooling_func
        linkage = 'ward'
    end
    
    methods
        
        function hObj = AgglomerativeClustering
            hObj@sklearnCluster('AgglomerativeClustering')
        end
        
        function set.compute_full_tree(hObj,x)
            if (ischar(x) && strcmp(x,'auto')) || islogical(x)
                hObj.pyCluster.compute_full_tree = x;
                hObj.compute_full_tree = x;
            end
        end
        
        function set.n_clusters(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.n_clusters = int16(x);
                hObj.n_clusters = int16(x);
            end
        end
        
        function set.connectivity(hObj,x)
            if isnumeric(x)
                hObj.pyCluster.connectivity = x;
                hObj.connectivity = x;
            end
        end
        
        function set.affinity(hObj,x)
            if ischar(x) && ismember(x,{'precomputed','cosine','euclidean','l1','l2','manhattan'})
                hObj.pyCluster.affinity = x;
                hObj.affinity = x;
            end
        end
        
        function set.memory(hObj,x)
            if isa(x,'sklearn.externals.joblib.memory.Memory') || (isa(x,'char') && exist(x,'path'))
                hObj.pyCluster.memory = x;
                hObj.memory = x;
            end
        end
        
        % function set.pooling_func(hObj,x)
        % 	if isa(x,function)
        % 		hObj.pyCluster.pooling_func = x;
        % 		hObj.pooling_func = x;
        % 		CHECK KWARGS
        % 	end
        % end
        
        function set.linkage(hObj,x)
            if ischar(x) && ismember(x,{'ward', 'complete', 'average'})
                hObj.pyCluster.linkage = x;
                hObj.linkage = x;
            end
        end
        
    end
    
    
    
    
end
