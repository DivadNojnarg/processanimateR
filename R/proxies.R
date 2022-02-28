#' Create a processAnimater proxy
#'
#' Avoids to re-render the same graph. Must be called on the server side
#'
#' @param shinyId Widget unique id.
#' @param session Shiny session.
#
#' @export
processAnimaterProxy <- function(shinyId,  session = shiny::getDefaultReactiveDomain()){
  if (is.null(session)) {
    stop("Proxy function must be called from the server function of a Shiny app")
  }

  object <- list(id = shinyId, session = session)
  class(object) <- "processAnimater_Proxy"
  object
}


#' Update processAnimater timeline
#'
#' @param proxy Proxy id.
#' @param duration New duration.
#' @export
updateTimeline <- function(proxy, duration) {
  data <- list(id = proxy$id, duration = as.numeric(duration))
  proxy$session$sendCustomMessage("update_timeline_processAnimater", data)
  return(proxy)
}
