
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
```
