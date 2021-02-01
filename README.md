
This website uses [Rmarkdown website](https://bookdown.org/yihui/rmarkdown/rmarkdown-site.html) method to knit chunks of processed R code with markdown to render HTML files.

## Render website

Render all source \*.Rmd files into \*.html:

```r
rmarkdown::render_site()
```

## Serve website

You can open the *.html files directly into a web browser, but for reliably serving the website it's best handled by opening the files within a local webserver:

```r
servr::httd()
```

## Bootstrap 4

Skipping Bootstrap 4 for now, but keeping _site.yml commented with option.

* [Add Bootstrap 4 support by cpsievert · Pull Request #1706 · rstudio/rmarkdown](https://github.com/rstudio/rmarkdown/pull/1706)

```r
remotes::install_github("rstudio/rmarkdown")
remotes::install_github("rstudio/htmltools")
remotes::install_github("rstudio/jquerylib")
remotes::install_github("rstudio/bslib")
```

* [7.9 Use a custom HTML template (*) | R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/html-template.html)
