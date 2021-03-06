% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/export_csv.R
\name{export_csv}
\alias{export_csv}
\title{Export a graph to CSV files}
\usage{
export_csv(graph, ndf_name = "nodes.csv", edf_name = "edges.csv",
  output_path = getwd(), colnames_type = NULL)
}
\arguments{
\item{graph}{a graph object.}

\item{ndf_name}{the name to provide to the CSV file
containing node information. By default this CSV
will be called \code{nodes.csv}.}

\item{edf_name}{the name to provide to the CSV file
containing edge information. By default this CSV
will be called \code{edges.csv}.}

\item{output_path}{the path to which the CSV files
will be placed. By default, this is the current
working directory.}

\item{colnames_type}{provides options to modify
CSV column names to allow for easier import into
other graph systems. The \code{neo4j} option
modifies column names to allow for direct import
of CSVs into Neo4J with the \code{LOAD CSV} clause.
The \code{graphframes} option modifies column names
to match those required by the Spark GraphFrames
package.}
}
\description{
Export a graph to CSV files.
}

