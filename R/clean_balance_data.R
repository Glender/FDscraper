#' After extracting balance data, clean it by removing redundant data
#' and extract only the numbers from it.
#'
#' @param data data.frame
#' @param remove_words character
#' @return
#' @export
clean_balance_data <- function(data, remove_words = "Totaal|Balans|Kas"){

  # remove cashflows, totals and header titles with years
  data <- dplyr::filter(data, !stringr::str_detect(X1, remove_words))

  # select only columns with numeric data, though they are chars atm
  data <- dplyr::select(data, !X1)

  # convert data.frame to vector
  data_vector <- c(as.matrix(data))

  # remove punctuation
  data_vector <- stringr::str_replace_all(data_vector, "[^[:alnum:]]", "")
  data_vector <- as.numeric(data_vector)

  return(data_vector)
}
