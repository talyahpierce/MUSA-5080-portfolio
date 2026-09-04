library(tidyverse)
library(tidycensus)

# load in the data #

pa_income <- get_acs(
  geography = "county",
  variables = "B19013_001",
  state = "PA",
  year = 2023,
  survey = "acs5")

# check the dimensions #

dim(pa_income)

# load in the wide version of the data #

pa_wide <- get_acs(
  geography = "county",
  variables = c(income = "B19013_001", pop = "B01003_001"),
  state = "PA",
  year = 2023,
  survey = "acs5",
  output = "wide")

# check the top ten counties #

pa_wide %>%
  mutate(moe_pct = incomeM / incomeE * 100) %>%
  arrange(desc(moe_pct)) %>%
  select(NAME, popE, incomeE, moe_pct) %>%
  head(10)

# finish early exercises #

load_variables(2023, "acs5")

ma_wide <- get_acs(
  geography = "county",
  variables = c(income = "B19013_001", pop = "B01003_001"),
  state = "MA",
  year = 2023,
  survey = "acs5",
  output = "wide")



