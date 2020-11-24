library(here)
library(fs)

# fix mermaid diagram js lib to latest
dir_copy(
  here("libs/mermaid_8.8.3/"), 
  here("site_libs/mermaid-0.3.0/dist/"),
  overwrite = T)