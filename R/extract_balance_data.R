#' Extract Balance sheet data from FD website.
#'
#' @param website character
#'
#' @return data.frame
#' @importFrom magrittr %>%
#' @export
extract_balance_data <- function(website){

  # extract html file from webpage to download
  # the tabl with balance information on that page
  html_doc <- rvest::read_html(website)

  # extract all tables from the html file
  lists <- rvest::html_elements(html_doc, "table") %>%
    rvest::html_table(
      na.strings = c("", "--", "0"),
      convert = TRUE,
      dec = ","
    )

  # extract the table with the most rows
  idx <- which.max(sapply(lists, nrow))
  data <- lists[[idx]]

  # if a row contains a missing, drop it
  data <- data[stats::complete.cases(data), ]

  return(data)
}
