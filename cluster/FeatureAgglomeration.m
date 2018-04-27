classdef FeatureAgglomeration < sklearnCluster
% MATLAB wrapper for sklearn.cluster.FeatureAgglomeration()
% Peter Cook 2018
    % Init signature: cluster.FeatureAgglomeration(self, n_clusters=2,
    % affinity='euclidean', memory=Memory(cachedir=None), connectivity=None,
    % compute_full_tree='auto', linkage='ward', pooling_func=<function mean at
    % 0x0000000002625518>)
    % Docstring:
    % Agglomerate features.
    
    % Similar to AgglomerativeClustering, but recursively merges features
    % instead of samples.
    
    % Read more in the :ref:`User Guide <hierarchical_clustering>`.
    
    % Parameters
    % ----------
    % n_clusters : int, default 2
    % The number of clusters to find.
    
    % connectivity : array-like or callable, optional
    % Connectivity matrix. Defines for each feature the neighboring
    % features following a given structure of the data.
    % This can be a connectivity matrix itself or a callable that transforms
    % the data into a connectivity matrix, such as derived from
    % kneighbors_graph. Default is None, i.e, the
    % hierarchical clustering algorithm is unstructured.
    
    % affinity : string or callable, default "euclidean"
    % Metric used to compute the linkage. Can be "euclidean", "l1", "l2",
    % "manhattan", "cosine", or 'precomputed'.
    % If linkage is "ward", only "euclidean" is accepted.
    
    % memory : Instance of joblib.Memory or string, optional
    % Used to cache the output of the computation of the tree.
    % By default, no caching is done. If a string is given, it is the
    % path to the caching directory.
    
    % compute_full_tree : bool or 'auto', optional, default "auto"
    % Stop early the construction of the tree at n_clusters. This is
    % useful to decrease computation time if the number of clusters is
    % not small compared to the number of features. This option is
    % useful only when specifying a connectivity matrix. Note also that
    % when varying the number of clusters and using caching, it may
    % be advantageous to compute the full tree.
    
    % linkage : {"ward", "complete", "average"}, optional, default "ward"
    % Which linkage criterion to use. The linkage criterion determines which
    % distance to use between sets of features. The algorithm will merge
    % the pairs of cluster that minimize this criterion.
    
    % - ward minimizes the variance of the clusters being merged.
    % - average uses the average of the distances of each feature of
    % the two sets.
    % - complete or maximum linkage uses the maximum distances between
    % all features of the two sets.
    
    % pooling_func : callable, default np.mean
    % This combines the values of agglomerated features into a single
    % value, and should accept an array of shape [M, N] and the keyword
    % argument `axis=1`, and reduce it to an array of size [M].
    
    % Attributes
    % ----------
    % labels_ : array-like, (n_features,)
    % cluster labels for each feature.
    
    % n_leaves_ : int
    % Number of leaves in the hierarchical tree.
    
    % n_components_ : int
    % The estimated number of connected components in the graph.
    
    % children_ : array-like, shape (n_nodes-1, 2)
    % The children of each non-leaf node. Values less than `n_features`
    % correspond to leaves of the tree which are the original samples.
    % A node `i` greater than or equal to `n_features` is a non-leaf
    % node and has children `children_[i - n_features]`. Alternatively
    % at the i-th iteration, children[i][0] and children[i][1]
    % are merged to form node `n_features + i`
    
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
        
        function hObj = FeatureAgglomeration
            hObj@sklearnCluster('FeatureAgglomeration')
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
        % if isa(x,function)
        % hObj.pyCluster.pooling_func = x;
        % hObj.pooling_func = x;
        % CHECK KWARGS
        % end
        % end
        
        function set.linkage(hObj,x)
            if ischar(x) && ismember(x,{'ward', 'complete', 'average'})
                hObj.pyCluster.linkage = x;
                hObj.linkage = x;
            end
        end
        
    end
    
end
