#' Show information about the current project.
#'
#' This function will return all of the information that ProjectTemplate has
#' about the current project. This information is gathered when
#' \code{\link{load.project}} is called. At present, ProjectTemplate keeps a
#' record of the project's configuration settings, all packages that were loaded
#' automatically and all of the data sets that were loaded automatically. The
#' information about autoloaded data sets is used by the
#' \code{\link{cache.project}} function.
#'
#' @details In previous releases this information has been available through the
#'   global variable \code{project.info}.  Using this variable is now deprecated
#'   and will result in a warning.
#'
#' @return A named list.
#'
#' @export
#'
#' @seealso \code{\link{create.project}}, \code{\link{load.project}},
#'   \code{\link{cache.project}}, \code{\link{show.project}}
#'
#' @examples
#' library('ProjectTemplate')
#'
#' \dontrun{load.project()
#'
#' get.project()}
get.project <- function()
{
  tryCatch(
    get("project.info", envir = .TargetEnv, inherits = FALSE),
    error = function(e) stop("Project must be loaded using load.project().")
  )
}


#' Check if the project was loaded
#'
#' Currently does a very basic check to see if the variable \code{project.info}
#' exists in the \code{.TargetEnv}. No check is performed on the contents of the
#' variable.
#'
#' @return Logical indicating whether the project was loaded.
#'
#' @keywords internal
#'
#' @rdname internal.has.project
.has.project <- function()
{
  exists("project.info", envir = .TargetEnv)
}
