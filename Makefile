report: Rmd/report.Rmd figs/barchart.png
	Rscript -e "install.packages('rmarkdown'); library(rmarkdown); render('Rmd/report.Rmd', output_file = 'output/report.html')"

figs/barchart.png: R/barchart.R
	Rscript R/barchart.R

.PHONY: report