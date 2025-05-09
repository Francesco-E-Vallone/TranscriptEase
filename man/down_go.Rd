% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analyses_GO.R
\name{down_go}
\alias{down_go}
\title{Perform GO Analysis on Down-regulated Genes}
\usage{
down_go(
  df,
  samples,
  databases = c("MSigDB_Hallmark_2020", "GO_Biological_Process_2023", "BioPlanet_2019",
    "GO_Cellular_Component_2023", "Reactome_Pathways_2024")
)
}
\arguments{
\item{df}{A data frame of differential expression results that must contain the columns \code{logFC} and \code{P.value}.
Row names should represent gene symbols.}

\item{samples}{A character string indicating the sample group, which is used in the plot titles.}

\item{databases}{A character vector specifying the databases to use for GO analysis. Default is:
\code{c("MSigDB_Hallmark_2020", "GO_Biological_Process_2023", "BioPlanet_2019",
  "GO_Cellular_Component_2023", "Reactome_Pathways_2024")}.
Importantly, only 5 databases are allowed at a time.}
}
\value{
A named list of ggplot2 objects, each representing a bar plot for the top 20 significant GO terms for a database.
}
\description{
This function performs Gene Ontology (GO) analysis on down-regulated genes from a differential
expression data frame. It works similarly to \code{up_go()} but filters for genes with \code{logFC} <= -1.
By default, a preset list of databases is used, but you can supply your own via the \code{databases} parameter.
Bar plots are generated for the top 20 GO terms.
}
\details{
The function filters the input data frame to include only genes with \code{logFC} <= -1 (down-regulated),
then uses the \code{enrichR} package to perform GO analysis. For each database, terms with \code{P.value} < 0.05 are
selected and plotted. The resulting plots display the top 20 GO terms based on p-value.
}
\examples{
\dontrun{
  # Assume df is your differential expression data frame with gene symbols as row names
  down_plots <- down_go(df, samples = "SampleGroup2")
}

}
