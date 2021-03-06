% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ti_sincell.R, R/ti_container.R
\name{ti_sincell}
\alias{ti_sincell}
\alias{ti_sincell}
\title{Inferring trajectories with Sincell}
\usage{
ti_sincell(docker = TRUE, distance_method = "euclidean",
  dimred_method = "none", clust.method = "max.distance", mutual = TRUE,
  max.distance = 0, k = 3, shortest.rank.percent = 10,
  graph.algorithm = "MST", graph.using.cells.clustering = FALSE,
  k_imc = 3, pct_leaf_node_cutoff = 0.5)

ti_sincell(docker = TRUE, distance_method = "euclidean",
  dimred_method = "none", clust.method = "max.distance", mutual = TRUE,
  max.distance = 0, k = 3, shortest.rank.percent = 10,
  graph.algorithm = "MST", graph.using.cells.clustering = FALSE,
  k_imc = 3, pct_leaf_node_cutoff = 0.5)
}
\arguments{
\item{docker}{Whether to use the docker container or the R wrapper}

\item{distance_method}{Distance method to be used. The available distances are the Euclidean distance (method="euclidean"), Manhattan distance (also called L1 distance, method="L1"), cosine distance (method="cosine") , distance based on Pearson (method="pearson") or Spearman (method="spearman") correlation coefficients, and distance based on Mutual Information (method="MI"). Intervals used to assess Mutual Information are indicated in the parameter "bins".}

\item{dimred_method}{Dimensionality reduction algorithm to be used. Options are: Principal Component Analysis (method="PCA"), Independent Component Analysis (method="ICA"; using fastICA() function in fastICA package), t-Distributed Stochastic Neighbor Embedding (method="tSNE"; using Rtsne() function in Rtsne package with parameters tsne.perplexity=1 and tsne.theta=0.25), classical Multidimensional Scaling (method="classical-MDS"; using the cmdscale() function) and non-metric Multidimensional Scaling (method="nonmetric-MDS";using the isoMDS() function in MASS package). if method="PCA" is chosen, the proportion of variance explained by each of the principal axes is plotted. We note that Sincell makes use of the Rtsne implementation of the Barnes-Hut algorithm, which approximates the likelihood. The user should be aware that this is a less accurate version of t-SNE than e.g. the one used as basis of viSNE (Amir,E.D. et al. 2013, Nat Biotechnol 31, 545-552).}

\item{clust.method}{
If clust.method="max.distance", clusters are defined as subgraphs generated by a maximum pair-wise distance cut-off, that is: from a totally connected graph where all cells are connected to each other, the algorithm only keeps pairs of cells connected by a distance lower than a given threshold.

If clust.method="percent", clusters are defined as subgraphs generated by a given rank-percentile of the shortest pair-wise distances, that is; from a totally connected graph where all cells are connected to each other, the algorithm only keeps the top “x” percent of shortest pairwise distances as indicated by "shortest.rank.percent".

If clust.method="knn", unsupervised K-Nearest Neighbors (K-NN) clustering is performed: From a totally disconnected graph where none of the cells are connected to each other, the algorithm connects each cell to its “k” nearest neighbors. If parameter "mutual=TRUE", Unsupervised K-Mutual Nearest Neighbours (K-MNN) clustering is performed, that is: only reciprocal k nearest neighbors are connected.

If clust.method="k-medoids", clustering around medoids (a more robust version of k-means) is performed with function "pam" from package "cluster" on the distance matrix in mySincellObject[["cell2celldist"]] with a desired number of groups indicated in parameter "num.clusters"

Hierarchical agglomerative clustering can be performed by internally calling function "hclust" where the agglomeration method is indicated in parameter "clust.method" as one of "ward.D", "ward.D2", "single", "complete", "average" (= UPGMA), "mcquitty" (= WPGMA), "median" (= WPGMC) or "centroid" (= UPGMC). Clusters are obtained by cutting the tree produced by hclust with function cutree with a desired number of groups indicated in parameter "num.clusters" 

}

\item{mutual}{
If clust.method="knn" and "mutual=TRUE", Unsupervised K-Mutual Nearest Neighbours (K-MNN) clustering is performed, that is: only reciprocal k nearest neighbors are connected.
}

\item{max.distance}{
in max.distance algorithm, select up to which distance the points will be linked
}

\item{k}{
If clust.method="knn", k is an integer specifying the number of nearest neighbors to consider in K-NN and K-KNN
}

\item{shortest.rank.percent}{
in percent algorithm, select the percent of shortest distances will be represented as links
}

\item{graph.algorithm}{
Graph building algorithm to be used: the Minimum Spanning Tree 
(graph.algorithm="MST"), the Maximum Similarity Spanning Tree 
(graph.algorithm="SST") and the Iterative Mutual Clustering Graph 
(graph.algorithm="IMC").
}

\item{graph.using.cells.clustering}{
If graph.using.cells.clustering=TRUE and graph.algorithm="MST" or graph.algorithm="MST", a precalculated clustering of cells is used. The clustering of cells is taken from SincellObject[["cellsClustering"]] as calculated by function sc_clusterObj().
}

\item{k_imc}{If IMC algorithm is selected, the number of nearest neighbors used in the underlying K-Mutual Nearest Neighbour (K-MNN) algorithm is set to k.}

\item{pct_leaf_node_cutoff}{Leaf nodes are iteratively removed until the percentage of leaf nodes is below the given cutoff. Removed nodes are projected to their closest neighbour. This is to constrain the number of milestones being created.}
}
\value{
The trajectory model
}
\description{
Inferring trajectories with Sincell

Will generate a trajectory using \href{https://doi.org/10.1093/bioinformatics/btv368}{Sincell}. This method was wrapped inside a \href{https://github.com/dynverse/dynmethods/tree/master/containers/sincell}{container}.
}
\details{
This methods was first wrapped inside R, see \link{ti_sincell}

The original code of this method is available \href{https://github.com/Cortalak/MCA_Sincell_0}{here}.

The method is described in: \href{https://doi.org/10.1093/bioinformatics/btv368}{Juliá, M., Telenti, A., Rausell, A., 2015. Sincell: an R/Bioconductor package for statistical assessment of cell-state hierarchies from single-cell RNA-seq: Fig. 1. Bioinformatics 31, 3380–3382.}
}
\seealso{
\code{\link[sincell:sc_distanceObj]{sincell::sc_distanceObj()}}, \code{\link[sincell:sc_DimensionalityReductionObj]{sincell::sc_DimensionalityReductionObj()}}, \code{\link[sincell:sc_clusterObj]{sincell::sc_clusterObj()}}
}
