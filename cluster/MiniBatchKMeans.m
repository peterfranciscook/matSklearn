classdef MiniBatchKMeans < sklearnCluster
% MATLAB wrapper for sklearn.cluster.MiniBatchKMeans()
% Peter Cook 2018
%
% Type:        MiniBatchKMeans
% String form:
% MiniBatchKMeans(batch_size=100, compute_labels=True, init='k-means++',
%            init_size=None, ma <...> ters=8,
%            n_init=3, random_state=None, reassignment_ratio=0.01, tol=0.0,
%            verbose=0)
% Docstring:  
% Mini-Batch K-Means clustering
% 
% Read more in the :ref:`User Guide <mini_batch_kmeans>`.
% 
% Parameters
% ----------
% 
% n_clusters : int, optional, default: 8
%     The number of clusters to form as well as the number of
%     centroids to generate.
% 
% max_iter : int, optional
%     Maximum number of iterations over the complete dataset before
%     stopping independently of any early stopping criterion heuristics.
% 
% max_no_improvement : int, default: 10
%     Control early stopping based on the consecutive number of mini
%     batches that does not yield an improvement on the smoothed inertia.
% 
%     To disable convergence detection based on inertia, set
%     max_no_improvement to None.
% 
% tol : float, default: 0.0
%     Control early stopping based on the relative center changes as
%     measured by a smoothed, variance-normalized of the mean center
%     squared position changes. This early stopping heuristics is
%     closer to the one used for the batch variant of the algorithms
%     but induces a slight computational and memory overhead over the
%     inertia heuristic.
% 
%     To disable convergence detection based on normalized center
%     change, set tol to 0.0 (default).
% 
% batch_size : int, optional, default: 100
%     Size of the mini batches.
% 
% init_size : int, optional, default: 3 * batch_size
%     Number of samples to randomly sample for speeding up the
%     initialization (sometimes at the expense of accuracy): the
%     only algorithm is initialized by running a batch KMeans on a
%     random subset of the data. This needs to be larger than n_clusters.
% 
% init : {'k-means++', 'random' or an ndarray}, default: 'k-means++'
%     Method for initialization, defaults to 'k-means++':
% 
%     'k-means++' : selects initial cluster centers for k-mean
%     clustering in a smart way to speed up convergence. See section
%     Notes in k_init for more details.
% 
%     'random': choose k observations (rows) at random from data for
%     the initial centroids.
% 
%     If an ndarray is passed, it should be of shape (n_clusters, n_features)
%     and gives the initial centers.
% 
% n_init : int, default=3
%     Number of random initializations that are tried.
%     In contrast to KMeans, the algorithm is only run once, using the
%     best of the ``n_init`` initializations as measured by inertia.
% 
% compute_labels : boolean, default=True
%     Compute label assignment and inertia for the complete dataset
%     once the minibatch optimization has converged in fit.
% 
% random_state : integer or numpy.RandomState, optional
%     The generator used to initialize the centers. If an integer is
%     given, it fixes the seed. Defaults to the global numpy random
%     number generator.
% 
% reassignment_ratio : float, default: 0.01
%     Control the fraction of the maximum number of counts for a
%     center to be reassigned. A higher value means that low count
%     centers are more easily reassigned, which means that the
%     model will take longer to converge, but should converge in a
%     better clustering.
% 
% verbose : boolean, optional
%     Verbosity mode.
% 
% Attributes
% ----------
% 
% cluster_centers_ : array, [n_clusters, n_features]
%     Coordinates of cluster centers
% 
% labels_ :
%     Labels of each point (if compute_labels is set to True).
% 
% inertia_ : float
%     The value of the inertia criterion associated with the chosen
%     partition (if compute_labels is set to True). The inertia is
%     defined as the sum of square distances of samples to their nearest
%     neighbor.
% 
% See also
% --------
% 
% KMeans
%     The classic implementation of the clustering method based on the
%     Lloyd's algorithm. It consumes the whole set of input data at each
%     iteration.
% 
% Notes
% -----
% See http://www.eecs.tufts.edu/~dsculley/papers/fastkmeans.pdf

    properties
        precompute_distances = 'auto'
        n_jobs = 1
        verbose = 0
        n_clusters = 8
        reassignment_ratio = 0.01
        max_iter = 100
        init_size = py.None
        batch_size = 100
        init = 'k-means++'
        random_state = py.None
        n_init = 3
        tol = 0.0
        max_no_improvement = 10
        copy_x = true
        algorithm = 'auto'
        compute_labels = true
    end
    
    methods
        
        function hObj = MiniBatchKMeans
            hObj@sklearnCluster('MiniBatchKMeans')
        end
        
        function set.precompute_distances(hObj,x)
            if (ischar(x) && strcmp(x,'auto')) || islogical(x)
                hObj.pyCluster.precompute_distances = x;
                hObj.precompute_distances = x;
            end
        end
        
        function set.n_jobs(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.n_jobs = int16(x);
                hObj.n_jobs = int16(x);
            end
        end
        
        function set.verbose(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.verbose = int16(x);
                hObj.verbose = int16(x);
            end
        end
        
        function set.n_clusters(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.n_clusters = int16(x);
                hObj.n_clusters = int16(x);
            end
        end
        
        function set.reassignment_ratio(hObj,x)
            if isfloat(x) && x>0
                hObj.pyCluster.reassignment_ratio = x;
                hObj.reassignment_ratio = x;
            end
        end
        
        function set.max_iter(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.max_iter = int16(x);
                hObj.max_iter = int16(x);
            end
        end
        
        function set.init_size(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.init_size = int16(x);
                hObj.init_size = int16(x);
            end
        end
        
        function set.batch_size(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.batch_size = int16(x);
                hObj.batch_size = int16(x);
            end
        end
        
        function set.init(hObj,x)
            if (ischar(x) && ismember(x,{'k-means++', 'random'})) || (isnumeric(x) && length(x)>1)
                hObj.pyCluster.init = x;
                hObj.init = x;
            end
        end
        
        function set.random_state(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.random_state = int64(x);
                hObj.random_state = int64(x);
            end
        end
        
        function set.n_init(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.n_init = int16(x);
                hObj.n_init = int16(x);
            end
        end
        
        function set.tol(hObj,x)
            if isfloat(x) && x>0
                hObj.pyCluster.tol = x;
                hObj.tol = x;
            end
        end
        
        function set.max_no_improvement(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.max_no_improvement = int16(x);
                hObj.max_no_improvement = int16(x);
            end
        end
        
        function set.copy_x(hObj,x)
            if islogical(x)
                hObj.pyCluster.copy_x = x;
                hObj.copy_x = x;
            end
        end
        
        function set.algorithm(hObj,x)
            if ischar(x) && ismember(x,{'auto','full','elkan'})
                hObj.pyCluster.algorithm = x;
                hObj.algorithm = x;
            end
        end
        
        function set.compute_labels(hObj,x)
            if islogical(x)
                hObj.pyCluster.compute_labels = x;
                hObj.compute_labels = x;
            end
        end
        
    end
    
end
