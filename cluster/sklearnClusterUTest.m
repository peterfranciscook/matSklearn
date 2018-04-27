%sandbox these algorithms on the much abused fisher iris dataset

load fisheriris
X = meas;
clearvars meas
columnLabel = {'Sepal Length','Sepal Width','Petal Length','Petal Width'};

hfig = figure;

%affinity propagation
clusterObject = AffinityPropagation;
y = clusterObject.fit_predict(X);
clusterLabel = unique(y);
subplot(2,4,1)
plot(X(y==0,1),X(y==0,2),'o');
hold on
for k = 2:length(clusterLabel)
    plot(X(y==(k-1),1),X(y==(k-1),2),'o');
end
xlabel(columnLabel{1})
ylabel(columnLabel{2})
title('Affinity Propagation')

%agglomerative clustering
clusterObject = AgglomerativeClustering;
clusterObject.n_clusters = int8(3);
y = clusterObject.fit_predict(X);
subplot(2,4,2)
plot(X(y==0,1),X(y==0,2),'o');
hold on
for k = 2:length(clusterLabel)
    plot(X(y==(k-1),1),X(y==(k-1),2),'o');
end
xlabel(columnLabel{1})
ylabel(columnLabel{2})
title('Agglomerative Clustering')

%birch
clusterObject = Birch;
clusterObject.n_clusters = int8(3);
y = clusterObject.fit_predict(X);
subplot(2,4,3)
plot(X(y==0,1),X(y==0,2),'o');
hold on
for k = 2:length(clusterLabel)
    plot(X(y==(k-1),1),X(y==(k-1),2),'o');
end
xlabel(columnLabel{1})
ylabel(columnLabel{2})
title('Birch')

%dbscan
clusterObject = DBSCAN;
% clusterObject.min_samples = int8(30);
clusterObject.eps = 0.375;
y = clusterObject.fit_predict(X);
subplot(2,4,4)
plot(X(y==0,1),X(y==0,2),'o');
hold on
for k = 2:length(clusterLabel)
    plot(X(y==(k-1),1),X(y==(k-1),2),'o');
end
xlabel(columnLabel{1})
ylabel(columnLabel{2})
title('DBSCAN')

%kmeans
clusterObject = KMeans;
clusterObject.n_clusters = int8(3);
y = clusterObject.fit_predict(X);
subplot(2,4,5)
plot(X(y==0,1),X(y==0,2),'o');
hold on
for k = 2:length(clusterLabel)
    plot(X(y==(k-1),1),X(y==(k-1),2),'o');
end
xlabel(columnLabel{1})
ylabel(columnLabel{2})
title('K-Means')

%meanshift
clusterObject = MeanShift;
y = clusterObject.fit_predict(X);
subplot(2,4,6)
plot(X(y==0,1),X(y==0,2),'o');
hold on
for k = 2:length(clusterLabel)
    plot(X(y==(k-1),1),X(y==(k-1),2),'o');
end
xlabel(columnLabel{1})
ylabel(columnLabel{2})
title('MeanShift')

%mini batch k means
clusterObject = MiniBatchKMeans;
clusterObject.n_clusters = int8(3);
y = clusterObject.fit_predict(X);
subplot(2,4,7)
plot(X(y==0,1),X(y==0,2),'o');
hold on
for k = 2:length(clusterLabel)
    plot(X(y==(k-1),1),X(y==(k-1),2),'o');
end
xlabel(columnLabel{1})
ylabel(columnLabel{2})
title('Mini-Batch K-Means')

%spectral
clusterObject = SpectralClustering;
clusterObject.n_clusters = int8(3);
y = clusterObject.fit_predict(X);
subplot(2,4,8)
plot(X(y==0,1),X(y==0,2),'o');
hold on
for k = 2:length(clusterLabel)
    plot(X(y==(k-1),1),X(y==(k-1),2),'o');
end
xlabel(columnLabel{1})
ylabel(columnLabel{2})
title('Spectral Clustering')

figure;
[~,~,bigAx]=gplotmatrix(X,[],species,[],[],[],'on','hist',columnLabel);
bigAx.Title.String = 'Fisher Iris Dataset Crossplot';