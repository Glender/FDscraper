#' Wrapper around FD url to scrape multiple websites at once
#'
#' @param urls Character. Link to website.
#'
#' @return
#' @export
scrape_fd_urls <- function(urls){

  # run scrape_fd_url on all urls
  links <- sapply(urls, scrape_fd_url)

  # make sure the output is correct
  links <- unique(unname(unlist(links)))

  return(links)
}
