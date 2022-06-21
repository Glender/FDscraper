#' Scrape a url from the FD website.
#'
#' @param url character
#' @importFrom magrittr %>%
#' @return
#' @export
scrape_fd_url <- function(url){

  # harvest urls from the beurs.fd.nl website
  page <- rvest::read_html(url)
  urls <- rvest::html_nodes(page, "a") %>%
    rvest::html_attr("href")

  # only retrieve the weblinks that contain 'noteringen' in it
  part_urls <- urls[stringr::str_detect(urls, "noteringen")]

  # create a full url and replace 'koersen' in 'noteringen'
  full_urls <- stringr::str_c("https://beurs.fd.nl", part_urls)
  weblinks <- stringr::str_replace_all(
    full_urls, "koersen", "kerncijfers"
  )
  return(weblinks)
}
