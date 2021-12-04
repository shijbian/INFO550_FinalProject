FROM rocker/rstudio:4.1.2
FROM rocker/tidyverse

# Install additional R packages, use command line to install R 
# packages
RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('oro.dicom')"
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('wesanderson')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('renv')"

RUN Rscript -e "library(tidyverse)"
RUN Rscript -e "library(oro.dicom)"
RUN Rscript -e "library(here)"
RUN Rscript -e "library(wesanderson)"
RUN Rscript -e "library(knitr)"
RUN Rscript -e "library(renv)"

# I added a new comment

# make a project directory in the container
# we will mount our local project directory to this directory
RUN mkdir /INFO550_FinalProject

# copy all contents (./) of local folder to project folder in container
COPY ./ /INFO550_FinalProject/

# make R scripts executable
RUN chmod +x /INFO550_FinalProject/

WORKDIR /INFO550_FinalProject

# make container entry point bash
CMD make -f Makefile
