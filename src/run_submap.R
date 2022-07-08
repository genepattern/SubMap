## The Broad Institute
## SOFTWARE COPYRIGHT NOTICE AGREEMENT
## This software and its documentation are copyright (2013) by the
## Broad Institute/Massachusetts Institute of Technology. All rights are
## reserved.
##
## This software is supplied without any warranty or guaranteed support
## whatsoever. Neither the Broad Institute nor MIT can be responsible for its
## use, misuse, or functionality

print(getwd())

suppressMessages(suppressWarnings(library(getopt)))
suppressMessages(suppressWarnings(library(optparse)))

sessionInfo()

args <- commandArgs(trailingOnly=TRUE)

libdir <- args[1]

option_list <- list(
  make_option("--input.data.A", dest="input.data.A"),
  make_option("--input.data.B", dest="input.data.B"),
  make_option("--input.cls.A", dest="input.cls.A"),
  make_option("--input.cls.B", dest="input.cls.B"),

  make_option("--output.filename", dest="output.filename", default="SubMap"),
  make_option("--num.marker.genes", dest="ntag", default=100),
  make_option("--num.perm", dest="nperm", default=50),
  make_option("--num.perm.fisher", dest="nperm.fisher", default=1000),
  make_option("--weighted.score.type", dest="weighted.score.type", default=1),
  make_option("--null.distribution", dest="null.dist", default="pool"),
  make_option("--p.value.correction", dest="p.corr", default="FDR"),
  make_option("--cluster.rows", dest="clust.row", default=1),
  make_option("--cluster.columns", dest="clust.col", default=1),
  make_option("--nominal.p.value.matrix", dest="nom.p.mat", default="F"),
  make_option("--create.legend", dest="create.legend", default="T"),
  make_option("--random.seed", dest="rnd.seed", default=47365321)

  )

opt <- parse_args(OptionParser(option_list=option_list), positional_arguments=TRUE, args=args)
print(opt)
opts <- opt$options

# returns string w/o leading or trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

# Returns NULL if the value is blank or a numeric if the value parses as numeric.
# Otherwise it stops execution with an error.
require.numeric.or.null <- function(value, paramName) {
  if (is.null(value)) { return(NULL) }
  trimmedValue = trim(value)
  if (trimmedValue == "") { return(NULL) }
  suppressWarnings(val <- as.numeric(trimmedValue))
  if (is.na(val)) {
      stop(paste("The parameter '", paramName, "' must be numeric or blank.  Received '", value, "'.", sep=""))  
  }
  return(val)
}

ntag <- require.numeric.or.null(opts$ntag, "ntag")
nperm <- require.numeric.or.null(opts$nperm, "nperm")
nperm.fisher <- require.numeric.or.null(opts$nperm.fisher, "nperm.fisher")
weighted.score.type <- require.numeric.or.null(opts$weighted.score.type, "weighted.score.type")
clust.row <- require.numeric.or.null(opts$clust.row, "clust.row")
clust.col <- require.numeric.or.null(opts$clust.col, "clust.col")
rnd.seed <- require.numeric.or.null(opts$rnd.seed, "rnd.seed")


source(file.path("/submap", "submap.R"))

#Rank.Normalize.Dataset(opts$input.file, opts$output.file.name, scale = scale, 
#                      threshold = threshold, ceiling = ceiling, shift = shift)

submap.main(
  opts$input.data.A,  opts$input.data.B,  opts$input.cls.A,
  opts$input.cls.B,  opts$output.filename,  ntag,  nperm,  nperm.fisher,  weighted.score.type,  opts$null.dist,
  opts$p.corr,  clust.row,  clust.col,  opts$nom.p.mat,  opts$create.legend,  rnd.seed
)
sessionInfo()
print(getwd())

