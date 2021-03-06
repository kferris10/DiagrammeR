% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/render_graph_from_series.R
\name{render_graph_from_series}
\alias{render_graph_from_series}
\title{Render a graph available in a series}
\usage{
render_graph_from_series(graph_series, graph_no, output = "graph",
  width = NULL, height = NULL)
}
\arguments{
\item{graph_series}{a graph series object of type
\code{dgr_graph_1D}.}

\item{graph_no}{the index of the graph in the graph
series.}

\item{output}{a string specifying the output type;
\code{graph} (the default) renders the graph using
the \code{grViz} function, \code{DOT} outputs DOT
code for the graph, and \code{SVG} provides SVG code
for the rendered graph.}

\item{width}{an optional parameter for specifying
the width of the resulting graphic in pixels.}

\item{height}{an optional parameter for specifying
the height of the resulting graphic in pixels.}
}
\description{
Using a graph series object of type
\code{dgr_graph_1D}, either render graph in the
Viewer or output in various formats.
}
\examples{
\dontrun{
library(magrittr)

# Create three graphs
graph_1 <-
  create_graph() \%>\%
  add_node("a") \%>\%
  add_node("b") \%>\%
  add_node("c") \%>\%
  add_edge("a", "c") \%>\%
  add_edge("a", "b") \%>\%
  add_edge("b", "c")

graph_2 <-
  graph_1 \%>\%
  add_node("d") \%>\%
  add_edge("d", "c")

graph_3 <-
  graph_2 \%>\%
  add_node("e") \%>\%
  add_edge("e", "b")

# Create an empty graph series
series <- create_series(series_type = "sequential")

# Add graphs to the graph series
series <- graph_1 \%>\% add_to_series(series)
series <- graph_2 \%>\% add_to_series(series)
series <- graph_3 \%>\% add_to_series(series)

# View the second graph in the series in the Viewer
render_graph_from_series(
  graph_series = series,
  graph_no = 2)
}
}

