#' Scrape Balance Sheet data from multiple FD websites
#'
#' @param websites Character. Vector of urls.
#'
#' @return
#' @export
scrape_fd_data <- function(websites){

  # empty container to store the results
  results <- vector("double", 0L)

  for (website in websites) {

    # extract data from each website
    data <- extract_balance_data(website)

    # remove redundant data
    data <- clean_balance_data(data)

    # merge the data together
    results <- c(results, data)

    # scraped data from
    cat("Scraped and merged data from:", get_company(website), "\n")
  }
  return(results)
}
