library(rmarkdown)
library(fs)

mmd_files <- list.files("diagrams", "\\.mmd$")

for (mmd in mmd_files){ # mmd = mmd_files[1]
  html <- paste0("regs_", path_ext_set(mmd, "html"))
  render(
    "regs_template.Rmd", 
    output_file = html,
    params = list(mmd = mmd))
}
