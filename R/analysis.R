#' Get some data from a public PostgreSQL instance
#'
#' This is really only to demonstrate that we can read from
#' PostgreSQL without having to set up our own server
#' @return A data.frame with the first 100 entries
getData <- function() {

    ## This is little more complicated than it needs to be but we
    ## wanted to show a package accessing PostgreSQL -- to highlight
    ## how packages RPostgreSQL and RPostgres differ in their
    ## dependency use and installation footprints.
    ##
    ## It turns out that the EMBL actually runs a publically
    ## accessibly PostgreSQL database -- see the site at
    ##    https://rnacentral.org/help/public-database
    ## for more -- and yay for Open Science!
    drv <- dbDriver("PostgreSQL")
    con <- dbConnect(drv,
                     host = "hh-pgsql-public.ebi.ac.uk",
                     port = 5432,
                     dbname = "pfmegrnargs",
                     user = "reader",
                     password = "NWDMCE5xdipIjRrp")

    ## this is of course not a terribly interesting query but we
    ## neither want to tax their resources nor do anything beyond
    ## simple demo here
    sql <- "select * from xref limit 500";
    res <- dbGetQuery(con, sql)
    dbDisconnect(con)

    res
}

#' Run a simple summary on the data
#'
#' @param data A data.frame
#' @return A data.frame
dataSummary <- function(data) {
    aggregate(dbid ~ taxid, data, length)
}
