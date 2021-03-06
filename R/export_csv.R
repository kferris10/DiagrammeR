#' Export a graph to CSV files
#' @description Export a graph to CSV files.
#' @param graph a graph object.
#' @param ndf_name the name to provide to the CSV file
#' containing node information. By default this CSV
#' will be called \code{nodes.csv}.
#' @param edf_name the name to provide to the CSV file
#' containing edge information. By default this CSV
#' will be called \code{edges.csv}.
#' @param output_path the path to which the CSV files
#' will be placed. By default, this is the current
#' working directory.
#' @param colnames_type provides options to modify
#' CSV column names to allow for easier import into
#' other graph systems. The \code{neo4j} option
#' modifies column names to allow for direct import
#' of CSVs into Neo4J with the \code{LOAD CSV} clause.
#' The \code{graphframes} option modifies column names
#' to match those required by the Spark GraphFrames
#' package.
#' @export export_csv

export_csv <- function(graph,
                       ndf_name = "nodes.csv",
                       edf_name = "edges.csv",
                       output_path = getwd(),
                       colnames_type = NULL) {

  nodes_df <- get_node_df(graph)
  edges_df <- get_edge_df(graph)

  # Modify column names for easier import into Neo4J
  # via `LOAD CSV`
  if (colnames_type == "neo4j") {

  # Modify column names in the ndf
  colnames(nodes_df)[1:3] <-
    c("nodes:ID", ":LABEL", "label")

  # Modify column names in the edf
  colnames(edges_df)[1:3] <-
    c(":START_ID", ":END_ID", ":TYPE")
  }

  # Modify column names for easier import into a
  # Spark GraphFrame after using the `csvreader`
  # package
  if (colnames_type == "graphframes") {

    # Modify column names in the ndf
    colnames(nodes_df)[1] <- "id"

    # Modify column names in the edf
    colnames(edges_df)[1:2] <-
      c("src", "dst")
  }

  # Write the CSV files to the output directory
  write.csv(nodes_df,
            file = paste0(output_path,
                          "/", ndf_name),
            row.names = FALSE)

  write.csv(edges_df,
            file = paste0(output_path,
                          "/", edf_name),
            row.names = FALSE)
}

