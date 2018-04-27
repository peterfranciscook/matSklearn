classdef sklearnCluster < handle
%matlab wrapper for sklearn clustering objects
%peter cook 2018
    properties
        pyCluster
    end
    
    methods
    % print [method for method in dir(cluster) if callable(getattr(cluster,method))] 
    % ['AffinityPropagation', 'AgglomerativeClustering', 'Birch', 'DBSCAN',
    % 'FeatureAgglomeration', 'KMeans', 'MeanShift', 'MiniBatchKMeans',
    % 'SpectralBiclustering', 'SpectralClustering', 'SpectralCoclustering']
    
    
        function hObj = sklearnCluster(clusterMethod)
        % <class 'sklearn.cluster.affinity_propagation_.AffinityPropagation'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'damping', 'max_iter', 'convergence_iter', 'copy',
        % 'preference', 'affinity', 'verbose'], varargs=None, keywords=None,
        % defaults=(0.5, 200, 15, True, None, 'euclidean', False))
        % 
        % Properties:
        % 
        % {'verbose': False, 'max_iter': 200, 'affinity': 'euclidean', 'damping':
        % 0.5, 'copy': True, 'convergence_iter': 15, 'preference': None}
        % 
        % Methods:
        % 
        % ['fit', 'fit_predict', 'get_params', 'predict', 'set_params']
        % cluster.AgglomerativeClustering()
        % 
        % 
        % <class 'sklearn.cluster.hierarchical.AgglomerativeClustering'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'n_clusters', 'affinity', 'memory', 'connectivity',
        % 'compute_full_tree', 'linkage', 'pooling_func'], varargs=None,
        % keywords=None, defaults=(2, 'euclidean', Memory(cachedir=None), None,
        % 'auto', 'ward', <function mean at 0x0000000002715518>))
        % 
        % Properties:
        % 
        % {'compute_full_tree': 'auto', 'n_clusters': 2, 'connectivity': None,
        % 'affinity': 'euclidean', 'memory': Memory(cachedir=None), 'pooling_func':
        % <function mean at 0x0000000002715518>, 'linkage': 'ward'}
        % 
        % Methods:
        % 
        % ['fit', 'fit_predict', 'get_params', 'set_params'] cluster.Birch()
        % 
        % 
        % <class 'sklearn.cluster.birch.Birch'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'threshold', 'branching_factor', 'n_clusters',
        % 'compute_labels', 'copy'], varargs=None, keywords=None, defaults=(0.5,
        % 50, 3, True, True))
        % 
        % Properties:
        % 
        % {'threshold': 0.5, 'branching_factor': 50, 'copy': True,
        % 'compute_labels': True, 'n_clusters': 3}
        % 
        % Methods:
        % 
        % ['fit', 'fit_predict', 'fit_transform', 'get_params', 'partial_fit',
        % 'predict', 'set_params', 'transform'] cluster.DBSCAN()
        % 
        % 
        % <class 'sklearn.cluster.dbscan_.DBSCAN'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'eps', 'min_samples', 'metric', 'algorithm',
        % 'leaf_size', 'p', 'n_jobs'], varargs=None, keywords=None, defaults=(0.5,
        % 5, 'euclidean', 'auto', 30, None, 1))
        % 
        % Properties:
        % 
        % {'n_jobs': 1, 'algorithm': 'auto', 'metric': 'euclidean', 'eps': 0.5,
        % 'p': None, 'leaf_size': 30, 'min_samples': 5}
        % 
        % Methods:
        % 
        % ['fit', 'fit_predict', 'get_params', 'set_params']
        % cluster.FeatureAgglomeration()
        % 
        % 
        % <class 'sklearn.cluster.hierarchical.FeatureAgglomeration'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'n_clusters', 'affinity', 'memory', 'connectivity',
        % 'compute_full_tree', 'linkage', 'pooling_func'], varargs=None,
        % keywords=None, defaults=(2, 'euclidean', Memory(cachedir=None), None,
        % 'auto', 'ward', <function mean at 0x0000000002715518>))
        % 
        % Properties:
        % 
        % {'compute_full_tree': 'auto', 'n_clusters': 2, 'connectivity': None,
        % 'affinity': 'euclidean', 'memory': Memory(cachedir=None), 'pooling_func':
        % <function mean at 0x0000000002715518>, 'linkage': 'ward'}
        % 
        % Methods:
        % 
        % ['fit', 'fit_predict', 'fit_transform', 'get_params',
        % 'inverse_transform', 'set_params', 'transform'] cluster.KMeans()
        % 
        % 
        % <class 'sklearn.cluster.k_means_.KMeans'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'n_clusters', 'init', 'n_init', 'max_iter', 'tol',
        % 'precompute_distances', 'verbose', 'random_state', 'copy_x', 'n_jobs',
        % 'algorithm'], varargs=None, keywords=None, defaults=(8, 'k-means++', 10,
        % 300, 0.0001, 'auto', 0, None, True, 1, 'auto'))
        % 
        % Properties:
        % 
        % {'precompute_distances': 'auto', 'n_jobs': 1, 'verbose': 0, 'n_clusters':
        % 8, 'max_iter': 300, 'init': 'k-means++', 'random_state': None, 'n_init':
        % 10, 'tol': 0.0001, 'copy_x': True, 'algorithm': 'auto'}
        % 
        % Methods:
        % 
        % ['fit', 'fit_predict', 'fit_transform', 'get_params', 'predict', 'score',
        % 'set_params', 'transform'] cluster.MeanShift()
        % 
        % 
        % <class 'sklearn.cluster.mean_shift_.MeanShift'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'bandwidth', 'seeds', 'bin_seeding',
        % 'min_bin_freq', 'cluster_all', 'n_jobs'], varargs=None, keywords=None,
        % defaults=(None, None, False, 1, True, 1))
        % 
        % Properties:
        % 
        % {'n_jobs': 1, 'bin_seeding': False, 'cluster_all': True, 'bandwidth':
        % None, 'seeds': None, 'min_bin_freq': 1}
        % 
        % Methods:
        % 
        % ['fit', 'fit_predict', 'get_params', 'predict', 'set_params']
        % cluster.MiniBatchKMeans()
        % 
        % 
        % <class 'sklearn.cluster.k_means_.MiniBatchKMeans'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'n_clusters', 'init', 'max_iter', 'batch_size',
        % 'verbose', 'compute_labels', 'random_state', 'tol', 'max_no_improvement',
        % 'init_size', 'n_init', 'reassignment_ratio'], varargs=None,
        % keywords=None, defaults=(8, 'k-means++', 100, 100, 0, True, None, 0.0,
        % 10, None, 3, 0.01))
        % 
        % Properties:
        % 
        % {'precompute_distances': 'auto', 'n_jobs': 1, 'verbose': 0, 'n_clusters':
        % 8, 'reassignment_ratio': 0.01, 'max_iter': 100, 'init_size': None,
        % 'batch_size': 100, 'init': 'k-means++', 'random_state': None, 'n_init':
        % 3, 'tol': 0.0, 'max_no_improvement': 10, 'copy_x': True, 'algorithm':
        % 'auto', 'compute_labels': True}
        % 
        % Methods:
        % 
        % ['fit', 'fit_predict', 'fit_transform', 'get_params', 'partial_fit',
        % 'predict', 'score', 'set_params', 'transform']
        % cluster.SpectralBiclustering()
        % 
        % 
        % <class 'sklearn.cluster.bicluster.SpectralBiclustering'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'n_clusters', 'method', 'n_components', 'n_best',
        % 'svd_method', 'n_svd_vecs', 'mini_batch', 'init', 'n_init', 'n_jobs',
        % 'random_state'], varargs=None, keywords=None, defaults=(3,
        % 'bistochastic', 6, 3, 'randomized', None, False, 'k-means++', 10, 1,
        % None))
        % 
        % Properties:
        % 
        % {'n_jobs': 1, 'n_clusters': 3, 'init': 'k-means++', 'svd_method':
        % 'randomized', 'mini_batch': False, 'random_state': None, 'n_init': 10,
        % 'n_svd_vecs': None, 'method': 'bistochastic', 'n_best': 3,
        % 'n_components': 6}
        % 
        % Methods:
        % 
        % ['fit', 'get_indices', 'get_params', 'get_shape', 'get_submatrix',
        % 'set_params'] cluster.SpectralClustering()
        % 
        % 
        % <class 'sklearn.cluster.spectral.SpectralClustering'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'n_clusters', 'eigen_solver', 'random_state',
        % 'n_init', 'gamma', 'affinity', 'n_neighbors', 'eigen_tol',
        % 'assign_labels', 'degree', 'coef0', 'kernel_params', 'n_jobs'],
        % varargs=None, keywords=None, defaults=(8, None, None, 10, 1.0, 'rbf', 10,
        % 0.0, 'kmeans', 3, 1, None, 1))
        % 
        % Properties:
        % 
        % {'n_neighbors': 10, 'n_jobs': 1, 'degree': 3, 'n_clusters': 8,
        % 'assign_labels': 'kmeans', 'kernel_params': None, 'random_state': None,
        % 'affinity': 'rbf', 'n_init': 10, 'eigen_solver': None, 'eigen_tol': 0.0,
        % 'coef0': 1, 'gamma': 1.0}
        % 
        % Methods:
        % 
        % ['fit', 'fit_predict', 'get_params', 'set_params']
        % cluster.SpectralCoclustering()
        % 
        % 
        % <class 'sklearn.cluster.bicluster.SpectralCoclustering'>
        % 
        % Args/Varargs/Kwargs:
        % 
        % ArgSpec(args=['self', 'n_clusters', 'svd_method', 'n_svd_vecs',
        % 'mini_batch', 'init', 'n_init', 'n_jobs', 'random_state'], varargs=None,
        % keywords=None, defaults=(3, 'randomized', None, False, 'k-means++', 10,
        % 1, None))
        % 
        % Properties:
        % 
        % {'n_jobs': 1, 'n_clusters': 3, 'init': 'k-means++', 'svd_method':
        % 'randomized', 'mini_batch': False, 'random_state': None, 'n_init': 10,
        % 'n_svd_vecs': None}
        % 
        % Methods:
        % 
        % ['fit', 'get_indices', 'get_params', 'get_shape', 'get_submatrix',
        % 'set_params']
            
        % ms = cluster.MeanShift(bandwidth=bandwidth, bin_seeding=True)
        % two_means = cluster.MiniBatchKMeans(n_clusters=params['n_clusters'])
        % ward = cluster.AgglomerativeClustering(
        %     n_clusters=params['n_clusters'], linkage='ward',
        %     connectivity=connectivity)
        % spectral = cluster.SpectralClustering(
        %     n_clusters=params['n_clusters'], eigen_solver='arpack',
        %     affinity="nearest_neighbors")
        % dbscan = cluster.DBSCAN(eps=params['eps'])
        % affinity_propagation = cluster.AffinityPropagation(
        %     damping=params['damping'], preference=params['preference'])
        % average_linkage = cluster.AgglomerativeClustering(
        %     linkage="average", affinity="cityblock",
        %     n_clusters=params['n_clusters'], connectivity=connectivity)
        % birch = cluster.Birch(n_clusters=params['n_clusters'])
        
        % {'cluster.AffinityPropagation()': {'methods': ['fit',
        %    'fit_predict',
        %    'get_params',
        %    'predict',
        %    'set_params'],
        %   'properties': {'affinity': 'euclidean',
        %    'convergence_iter': 15,
        %    'copy': True,
        %    'damping': 0.5,
        %    'max_iter': 200,
        %    'preference': None,
        %    'verbose': False}},
        %  'cluster.AgglomerativeClustering()': {'methods': ['fit',
        %    'fit_predict',
        %    'get_params',
        %    'set_params'],
        %   'properties': {'affinity': 'euclidean',
        %    'compute_full_tree': 'auto',
        %    'connectivity': None,
        %    'linkage': 'ward',
        %    'memory': Memory(cachedir=None),
        %    'n_clusters': 2,
        %    'pooling_func': <function numpy.core.fromnumeric.mean>}},
        %  'cluster.Birch()': {'methods': ['fit',
        %    'fit_predict',
        %    'fit_transform',
        %    'get_params',
        %    'partial_fit',
        %    'predict',
        %    'set_params',
        %    'transform'],
        %   'properties': {'branching_factor': 50,
        %    'compute_labels': True,
        %    'copy': True,
        %    'n_clusters': 3,
        %    'threshold': 0.5}},
        %  'cluster.DBSCAN()': {'methods': ['fit',
        %    'fit_predict',
        %    'get_params',
        %    'set_params'],
        %   'properties': {'algorithm': 'auto',
        %    'eps': 0.5,
        %    'leaf_size': 30,
        %    'metric': 'euclidean',
        %    'min_samples': 5,
        %    'n_jobs': 1,
        %    'p': None}},
        %  'cluster.FeatureAgglomeration()': {'methods': ['fit',
        %    'fit_predict',
        %    'fit_transform',
        %    'get_params',
        %    'inverse_transform',
        %    'set_params',
        %    'transform'],
        %   'properties': {'affinity': 'euclidean',
        %    'compute_full_tree': 'auto',
        %    'connectivity': None,
        %    'linkage': 'ward',
        %    'memory': Memory(cachedir=None),
        %    'n_clusters': 2,
        %    'pooling_func': <function numpy.core.fromnumeric.mean>}},
        %  'cluster.KMeans()': {'methods': ['fit',
        %    'fit_predict',
        %    'fit_transform',
        %    'get_params',
        %    'predict',
        %    'score',
        %    'set_params',
        %    'transform'],
        %   'properties': {'algorithm': 'auto',
        %    'copy_x': True,
        %    'init': 'k-means++',
        %    'max_iter': 300,
        %    'n_clusters': 8,
        %    'n_init': 10,
        %    'n_jobs': 1,
        %    'precompute_distances': 'auto',
        %    'random_state': None,
        %    'tol': 0.0001,
        %    'verbose': 0}},
        %  'cluster.MeanShift()': {'methods': ['fit',
        %    'fit_predict',
        %    'get_params',
        %    'predict',
        %    'set_params'],
        %   'properties': {'bandwidth': None,
        %    'bin_seeding': False,
        %    'cluster_all': True,
        %    'min_bin_freq': 1,
        %    'n_jobs': 1,
        %    'seeds': None}},
        %  'cluster.MiniBatchKMeans()': {'methods': ['fit',
        %    'fit_predict',
        %    'fit_transform',
        %    'get_params',
        %    'partial_fit',
        %    'predict',
        %    'score',
        %    'set_params',
        %    'transform'],
        %   'properties': {'algorithm': 'auto',
        %    'batch_size': 100,
        %    'compute_labels': True,
        %    'copy_x': True,
        %    'init': 'k-means++',
        %    'init_size': None,
        %    'max_iter': 100,
        %    'max_no_improvement': 10,
        %    'n_clusters': 8,
        %    'n_init': 3,
        %    'n_jobs': 1,
        %    'precompute_distances': 'auto',
        %    'random_state': None,
        %    'reassignment_ratio': 0.01,
        %    'tol': 0.0,
        %    'verbose': 0}},
        %  'cluster.SpectralBiclustering()': {'methods': ['fit',
        %    'get_indices',
        %    'get_params',
        %    'get_shape',
        %    'get_submatrix',
        %    'set_params'],
        %   'properties': {'init': 'k-means++',
        %    'method': 'bistochastic',
        %    'mini_batch': False,
        %    'n_best': 3,
        %    'n_clusters': 3,
        %    'n_components': 6,
        %    'n_init': 10,
        %    'n_jobs': 1,
        %    'n_svd_vecs': None,
        %    'random_state': None,
        %    'svd_method': 'randomized'}},
        %  'cluster.SpectralClustering()': {'methods': ['fit',
        %    'fit_predict',
        %    'get_params',
        %    'set_params'],
        %   'properties': {'affinity': 'rbf',
        %    'assign_labels': 'kmeans',
        %    'coef0': 1,
        %    'degree': 3,
        %    'eigen_solver': None,
        %    'eigen_tol': 0.0,
        %    'gamma': 1.0,
        %    'kernel_params': None,
        %    'n_clusters': 8,
        %    'n_init': 10,
        %    'n_jobs': 1,
        %    'n_neighbors': 10,
        %    'random_state': None}},
        %  'cluster.SpectralCoclustering()': {'methods': ['fit',
        %    'get_indices',
        %    'get_params',
        %    'get_shape',
        %    'get_submatrix',
        %    'set_params'],
        %   'properties': {'init': 'k-means++',
        %    'mini_batch': False,
        %    'n_clusters': 3,
        %    'n_init': 10,
        %    'n_jobs': 1,
        %    'n_svd_vecs': None,
        %    'random_state': None,
        %    'svd_method': 'randomized'}}}
            flavors = {'AffinityPropagation', 'AgglomerativeClustering',...
                       'Birch', 'DBSCAN', 'FeatureAgglomeration', 'KMeans',...
                       'MeanShift', 'MiniBatchKMeans', 'SpectralClustering'};
            
            if ismember(clusterMethod,flavors)
                hObj.pyCluster = py.sklearn.cluster.(clusterMethod);
            else
                return
            end
            
        end
        
        function fit(hObj,X)
            
            %make sure the array has the correct dimensions
            [mRow,nCol] = size(X);
            if mRow < nCol
                X = X';
            end
            x = py.numpy.reshape(py.numpy.array(X(:)'),[int16(nCol),int16(mRow)]);
            x = x.T;
            hObj.pyCluster.fit(x)

        end
        
        function y = fit_predict(hObj,X)
            
            %make sure the array has the correct dimensions
            [mRow,nCol] = size(X);
            if mRow < nCol
                X = X';
            end
            x = py.numpy.reshape(py.numpy.array(X(:)'),[int16(nCol),int16(mRow)]);
            x = x.T; %transpose again
            y = hObj.pyCluster.fit_predict(x);
            y = cellfun(@double,cell(y.tolist()));
            
        end

        function paramDict = get_params(hObj)
            paramDict = hObj.pyCluster.get_params;
        end
        
        function set_params(hObj,varargin)
            %no error checking. CAUTION!
            for k = 1:2:nargin-1
                hObj.pyCluster.(varargin{k}) = varargin{k+1};
            end
        end

        
        
    end
    
    
    
end














