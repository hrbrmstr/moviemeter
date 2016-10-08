#' Get or set MOVIEMETER_API_KEY value
#'
#' The API wrapper functions in this package all rely on a MovieMeter API
#' key residing in the environment variable \code{MOVIEMETER_API_KEY}. The
#' easiest way to accomplish this is to set it in the `\code{.Renviron}` file in your
#' home directory.
#'
#' @param force force setting a new MovieMeter API key for the current environment?
#' @return atomic character vector containing the MovieMeter API key
#' @export
moviemeter_api_key <- function(force = FALSE) {

  env <- Sys.getenv('MOVIEMETER_API_KEY')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var MOVIEMETER_API_KEY to your MovieMeter API key",
      call. = FALSE)
  }

  message("Couldn't find env var MOVIEMETER_API_KEY See ?moviemeter_api_key for more details.")
  message("Please enter your API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("MovieMeter API key entry failed", call. = FALSE)
  }

  message("Updating MOVIEMETER_API_KEY env var to PAT")
  Sys.setenv(MOVIEMETER_API_KEY = pat)

  pat

}
