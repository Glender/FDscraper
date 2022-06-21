#' Extract brand name from url
#'
#' @param url character.
#'
#' @return
#' @export
get_company <- function(url){

  # extract brand name from url
  start_idx <- unname(stringr::str_locate_all(url, "/")[[1]][5, 1])
  end_idx <- unname(stringr::str_locate(url, "kern")[1, 1])

  # get the name of the company
  return(stringr::str_sub(url, start_idx+1, end_idx-2))
}
