#' Extract Balance sheet data from the FD website.
#'
#' @param website character. url.
#' @param remove_chars character. What characters do you want to
#' remove from the balance sheet data. Default: c("", "--", "0").
#' @param dec character. Default: ','
#'
#' @return data.frame
#' @importFrom magrittr %>%
#' @export
#' @examples
#' data <- extract_balance_data("https://beurs.fd.nl/noteringen/11755/ahold-delhaize/kerncijfers")
#' print(data)
extract_balance_data <- function(
    website, remove_chars = c("", "--", "0"), dec = ","
  ){

  # extract html file from webpage to download
  # the tabl with balance information on that page
  html_doc <- rvest::read_html(website)

  # extract all tables from the html file
  lists <- rvest::html_elements(html_doc, "table") %>%
    rvest::html_table(
      na.strings = remove_chars,
      convert = TRUE,
      dec = dec
    )

  # extract the table with the most rows
  idx <- which.max(sapply(lists, nrow))
  data <- lists[[idx]]

  # if a row contains a missing, drop it
  data <- data[stats::complete.cases(data), ]

  return(data)
}
