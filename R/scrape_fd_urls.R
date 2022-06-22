#' Wrapper around `scrape_fd_url` to find balance sheet data from
#' specific companies.
#'
#' @param urls Character. Link to website.
#'
#' @return
#' @export
#' @examples
#'# urls to scrape weblinks from
#'urls <- c(
#'"https://beurs.fd.nl/analyse/amsterdam/aex/",
#'"https://beurs.fd.nl/analyse/amsterdam/midkap/"
#')
#'websites <- scrape_fd_urls(urls)
#'print(websites)
scrape_fd_urls <- function(urls){

  # run scrape_fd_url on all urls
  links <- sapply(urls, scrape_fd_url)

  # make sure the output is correct
  links <- unique(Reduce(c, links))

  return(links)
}
