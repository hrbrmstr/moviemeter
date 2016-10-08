#' Search for films
#'
#' @param terms atomic character vector to use in the search
#' @return \code{tibble}
#' @references \url{http://wiki.moviemeter.nl/index.php/API}
#' @export
#' @examples
#' mm_search("brave little toaster")
mm_search <- function(terms) {

  res <- httr::GET("http://www.moviemeter.nl/api/film/",
                   query=list(q=terms, api_key=moviemeter_api_key()))

  stop_for_status(res)

  res <- httr::content(res, as="text", encoding="UTF-8")
  res <- jsonlite::fromJSON(res)
  res <- as_tibble(res)

  res

}

#' Retrieve film information
#'
#' Pass in either a MovieMeter ID or IMDB code to retrieve movie info.
#'
#' @param movie_id either a MovieMeter ID or IMDB code
#' @return \code{list}
#' @references \url{http://wiki.moviemeter.nl/index.php/API}
#' @export
#' @examples
#' mm_get_movie_info(5208)
mm_get_movie_info <- function(movie_id) {

  res <- httr::GET(sprintf("http://www.moviemeter.nl/api/film/%s", movie_id),
                   query=list(api_key=moviemeter_api_key()))

  stop_for_status(res)

  res <- httr::content(res, as="text", encoding="UTF-8")
  res <- jsonlite::fromJSON(res)

  res

}