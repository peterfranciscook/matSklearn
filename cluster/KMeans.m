classdef KMeans < sklearnCluster
% MATLAB wrapper for sklearn.cluster.KMeans()
% Peter Cook 2018
%
% Type:        KMeans
% String form:
% KMeans(algorithm='auto', copy_x=True, init='k-means++', max_iter=300,
%     n_clusters=8, n_init=10, n_jobs=1, precompute_distances='auto',
%     random_state=None, tol=0.0001, verbose=0)
% Docstring:  
% K-Means clustering
% 
% Read more in the :ref:`User Guide <k_means>`.
% 
% Parameters
% ----------
% 
% n_clusters : int, optional, default: 8
%     The number of clusters to form as well as the number of
%     centroids to generate.
% 
% max_iter : int, default: 300
%     Maximum number of iterations of the k-means algorithm for a
%     single run.
% 
% n_init : int, default: 10
%     Number of time the k-means algorithm will be run with different
%     centroid seeds. The final results will be the best output of
%     n_init consecutive runs in terms of inertia.
% 
% init : {'k-means++', 'random' or an ndarray}
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
% algorithm : "auto", "full" or "elkan", default="auto"
%     K-means algorithm to use. The classical EM-style algorithm is "full".
%     The "elkan" variation is more efficient by using the triangle
%     inequality, but currently doesn't support sparse data. "auto" chooses
%     "elkan" for dense data and "full" for sparse data.
% 
% precompute_distances : {'auto', True, False}
%     Precompute distances (faster but takes more memory).
% 
%     'auto' : do not precompute distances if n_samples * n_clusters > 12
%     million. This corresponds to about 100MB overhead per job using
%     double precision.
% 
%     True : always precompute distances
% 
%     False : never precompute distances
% 
% tol : float, default: 1e-4
%     Relative tolerance with regards to inertia to declare convergence
% 
% n_jobs : int
%     The number of jobs to use for the computation. This works by computing
%     each of the n_init runs in parallel.
% 
%     If -1 all CPUs are used. If 1 is given, no parallel computing code is
%     used at all, which is useful for debugging. For n_jobs below -1,
%     (n_cpus + 1 + n_jobs) are used. Thus for n_jobs = -2, all CPUs but one
%     are used.
% 
% random_state : integer or numpy.RandomState, optional
%     The generator used to initialize the centers. If an integer is
%     given, it fixes the seed. Defaults to the global numpy random
%     number generator.
% 
% verbose : int, default 0
%     Verbosity mode.
% 
% copy_x : boolean, default True
%     When pre-computing distances it is more numerically accurate to center
%     the data first.  If copy_x is True, then the original data is not
%     modified.  If False, the original data is modified, and put back before
%     the function returns, but small numerical differences may be introduced
%     by subtracting and then adding the data mean.
% 
% Attributes
% ----------
% cluster_centers_ : array, [n_clusters, n_features]
%     Coordinates of cluster centers
% 
% labels_ :
%     Labels of each point
% 
% inertia_ : float
%     Sum of distances of samples to their closest cluster center.
% 
% Examples
% --------
% 
% from sklearn.cluster import KMeans
% import numpy as np
% X = np.array([[1, 2], [1, 4], [1, 0],
%               [4, 2], [4, 4], [4, 0]])
% kmeans = KMeans(n_clusters=2, random_state=0).fit(X)
% kmeans.labels_
% array([0, 0, 0, 1, 1, 1], dtype=int32)
% kmeans.predict([[0, 0], [4, 4]])
% array([0, 1], dtype=int32)
% kmeans.cluster_centers_
% array([[ 1.,  2.],
%        [ 4.,  2.]])
% 
% See also
% --------
% 
% MiniBatchKMeans
%     Alternative online implementation that does incremental updates
%     of the centers positions using mini-batches.
%     For large scale learning (say n_samples > 10k) MiniBatchKMeans is
%     probably much faster than the default batch implementation.
% 
% Notes
% ------
% The k-means problem is solved using Lloyd's algorithm.
% 
% The average complexity is given by O(k n T), were n is the number of
% samples and T is the number of iteration.
% 
% The worst case complexity is given by O(n^(k+2/p)) with
% n = n_samples, p = n_features. (D. Arthur and S. Vassilvitskii,
% 'How slow is the k-means method?' SoCG2006)
% 
% In practice, the k-means algorithm is very fast (one of the fastest
% clustering algorithms available), but it falls in local minima. That's why
% it can be useful to restart it several times.

    properties
        precompute_distances = 'auto'
        n_jobs = 1
        verbose = 0
        n_clusters = 8
        max_iter = 300
        init = 'k-means++'
        random_state = py.None
        n_init = 10
        tol = 0.0001
        copy_x = true
        algorithm = 'auto'
    end
    
    methods
        
        function hObj = KMeans
            hObj@sklearnCluster('KMeans')
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
        
        function set.max_iter(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.max_iter = int16(x);
                hObj.max_iter = int16(x);
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
        
    end
    
end
