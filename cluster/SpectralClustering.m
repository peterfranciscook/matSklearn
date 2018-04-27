classdef SpectralClustering < sklearnCluster
% MATLAB wrapper for sklearn.cluster.SpectralClustering()
% Peter Cook 2018
%
% Type:        SpectralClustering
% String form:
% SpectralClustering(affinity='rbf', assign_labels='kmeans', coef0=1, degree=3,
%            eigen_sol <...> s=None,
%            n_clusters=8, n_init=10, n_jobs=1, n_neighbors=10,
%            random_state=None)
% Docstring:  
% Apply clustering to a projection to the normalized laplacian.
% 
% In practice Spectral Clustering is very useful when the structure of
% the individual clusters is highly non-convex or more generally when
% a measure of the center and spread of the cluster is not a suitable
% description of the complete cluster. For instance when clusters are
% nested circles on the 2D plan.
% 
% If affinity is the adjacency matrix of a graph, this method can be
% used to find normalized graph cuts.
% 
% When calling ``fit``, an affinity matrix is constructed using either
% kernel function such the Gaussian (aka RBF) kernel of the euclidean
% distanced ``d(X, X)``::
% 
%         np.exp(-gamma * d(X,X) ** 2)
% 
% or a k-nearest neighbors connectivity matrix.
% 
% Alternatively, using ``precomputed``, a user-provided affinity
% matrix can be used.
% 
% Read more in the :ref:`User Guide <spectral_clustering>`.
% 
% Parameters
% -----------
% n_clusters : integer, optional
%     The dimension of the projection subspace.
% 
% affinity : string, array-like or callable, default 'rbf'
%     If a string, this may be one of 'nearest_neighbors', 'precomputed',
%     'rbf' or one of the kernels supported by
%     `sklearn.metrics.pairwise_kernels`.
% 
%     Only kernels that produce similarity scores (non-negative values that
%     increase with similarity) should be used. This property is not checked
%     by the clustering algorithm.
% 
% gamma : float, default=1.0
%     Scaling factor of RBF, polynomial, exponential chi^2 and
%     sigmoid affinity kernel. Ignored for
%     ``affinity='nearest_neighbors'``.
% 
% degree : float, default=3
%     Degree of the polynomial kernel. Ignored by other kernels.
% 
% coef0 : float, default=1
%     Zero coefficient for polynomial and sigmoid kernels.
%     Ignored by other kernels.
% 
% n_neighbors : integer
%     Number of neighbors to use when constructing the affinity matrix using
%     the nearest neighbors method. Ignored for ``affinity='rbf'``.
% 
% eigen_solver : {None, 'arpack', 'lobpcg', or 'amg'}
%     The eigenvalue decomposition strategy to use. AMG requires pyamg
%     to be installed. It can be faster on very large, sparse problems,
%     but may also lead to instabilities
% 
% random_state : int seed, RandomState instance, or None (default)
%     A pseudo random number generator used for the initialization
%     of the lobpcg eigen vectors decomposition when eigen_solver == 'amg'
%     and by the K-Means initialization.
% 
% n_init : int, optional, default: 10
%     Number of time the k-means algorithm will be run with different
%     centroid seeds. The final results will be the best output of
%     n_init consecutive runs in terms of inertia.
% 
% eigen_tol : float, optional, default: 0.0
%     Stopping criterion for eigendecomposition of the Laplacian matrix
%     when using arpack eigen_solver.
% 
% assign_labels : {'kmeans', 'discretize'}, default: 'kmeans'
%     The strategy to use to assign labels in the embedding
%     space. There are two ways to assign labels after the laplacian
%     embedding. k-means can be applied and is a popular choice. But it can
%     also be sensitive to initialization. Discretization is another approach
%     which is less sensitive to random initialization.
% 
% kernel_params : dictionary of string to any, optional
%     Parameters (keyword arguments) and values for kernel passed as
%     callable object. Ignored by other kernels.
% 
% n_jobs : int, optional (default = 1)
%     The number of parallel jobs to run.
%     If ``-1``, then the number of jobs is set to the number of CPU cores.
% 
% Attributes
% ----------
% affinity_matrix_ : array-like, shape (n_samples, n_samples)
%     Affinity matrix used for clustering. Available only if after calling
%     ``fit``.
% 
% labels_ :
%     Labels of each point
% 
% Notes
% -----
% If you have an affinity matrix, such as a distance matrix,
% for which 0 means identical elements, and high values means
% very dissimilar elements, it can be transformed in a
% similarity matrix that is well suited for the algorithm by
% applying the Gaussian (RBF, heat) kernel::
% 
%     np.exp(- dist_matrix ** 2 / (2. * delta ** 2))
% 
% Where ``delta`` is a free parameter representing the width of the Gaussian
% kernel.
% 
% Another alternative is to take a symmetric version of the k
% nearest neighbors connectivity matrix of the points.
% 
% If the pyamg package is installed, it is used: this greatly
% speeds up computation.
% 
% References
% ----------
% 
% - Normalized cuts and image segmentation, 2000
%   Jianbo Shi, Jitendra Malik
%   http://citeseer.ist.psu.edu/viewdoc/summary?doi=10.1.1.160.2324
% 
% - A Tutorial on Spectral Clustering, 2007
%   Ulrike von Luxburg
%   http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.165.9323
% 
% - Multiclass spectral clustering, 2003
%   Stella X. Yu, Jianbo Shi
%   http://www1.icsi.berkeley.edu/~stellayu/publication/doc/2003kwayICCV.pdf

    properties
        n_neighbors = 10
        n_jobs = 1
        degree = 3
        n_clusters = 8
        assign_labels = 'kmeans'
        kernel_params = py.None
        random_state = py.None
        affinity = 'rbf'
        n_init = 10
        eigen_solver = py.None
        eigen_tol = 0.0
        coef0 = 1
        gamma = 1.0
    end
    
    methods
        
        function hObj = SpectralClustering
            hObj@sklearnCluster('SpectralClustering')
        end
        
        function set.n_neighbors(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.n_neighbors = int16(x);
                hObj.n_neighbors = int16(x);
            end
        end
        
        function set.n_jobs(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.n_jobs = int16(x);
                hObj.n_jobs = int16(x);
            end
        end
        
        function set.degree(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.degree = int16(x);
                hObj.degree = int16(x);
            end
        end
        
        function set.n_clusters(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.n_clusters = int16(x);
                hObj.n_clusters = int16(x);
            end
        end
        
        function set.assign_labels(hObj,x)
            if ischar(x) && ismember(x,{'kmeans', 'discretize'})
                hObj.pyCluster.assign_labels = x;
                hObj.assign_labels = x;
            end
        end
        
        function set.kernel_params(hObj,x)
            if isa(x,'py.dict')
                hObj.pyCluster.kernel_params = x;
                hObj.kernel_params = x;
            end
        end
        
        function set.random_state(hObj,x)
            if isnumeric(x)
                hObj.pyCluster.random_state = int64(x);
                hObj.random_state = int64(x);
            end
        end
        
        function set.affinity(hObj,x)
            if ischar(x) && ismember(x,{'rbf', 'sigmoid', 'polynomial',...
                    'poly', 'linear', 'cosine', 'nearest_neighbors', 'precomputed'})
                hObj.pyCluster.affinity = x;
                hObj.affinity = x;
            end
        end
        
        function set.n_init(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.n_init = int16(x);
                hObj.n_init = int16(x);
            end
        end
        
        function set.eigen_solver(hObj,x)
            if ischar(x) && ismember(x,{'arpack', 'lobpcg', or 'amg'})
                hObj.pyCluster.eigen_solver = x;
                hObj.eigen_solver = x;
            end
        end
        
        function set.eigen_tol(hObj,x)
            if isfloat(x) && x>0
                hObj.pyCluster.eigen_tol = x;
                hObj.eigen_tol = x;
            end
        end
        
        function set.coef0(hObj,x)
            if isnumeric(x) && x>0
                hObj.pyCluster.coef0 = int16(x);
                hObj.coef0 = int16(x);
            end
        end
        
        function set.gamma(hObj,x)
            if isfloat(x) && x>0
                hObj.pyCluster.gamma = x;
                hObj.gamma = x;
            end
        end
        
    end
    
end
