library(dplyr)
d <- read.csv("data/hcahps_output.txt", sep = "|", stringsAsFactors = FALSE)

d$StartDate[d$StartDate == "4/1/2012"] <- "04/01/2012"
d$EndDate[d$EndDate == "3/31/2013"] <- "03/31/2013"

d$StartDate <- as.Date(d$StartDate, "%m/%d/%Y")
d$EndDate <- as.Date(d$EndDate, "%m/%d/%Y")

d <- arrange(d, StartDate, type, variable)

hospitals <- d %>%
  filter(type == "Hospital") %>%
  select(variable)

hospitals <- as.vector(unique(hospitals$variable))

benchmarks <- d %>%
  filter(type == "Benchmark") %>%
  select(variable)

benchmarks <- as.vector(unique(benchmarks$variable))
