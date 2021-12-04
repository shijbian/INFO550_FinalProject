## INFO 550 Final Project

### Introduction

This is the project repo for INFO550 final project in Fall 2021. 

The goal of this analysis is to improve the diagnosis of giloblastoma by defining the genetic subtype of giloblastoma using MRI imaging scan. The data is composed with a training set (N = 585) and a testing set (N = 87). The subject-level MGMT promoter methylation value for the training set is also provided in the csv file *train_labels.csv*. The model performance will be evaluated by predicting the hidden label of the testing set. The data size is 136.85 GB.

*INFO550_FinalProject* is the name of the project repository. The data are stored under the folder /Data. The R markdown file you will knit is /Rmd/report.Rmd.

*final-project* is the container name on Docker.

To knit the R Markdown file, you will need to cd into the folder *INFO550_Assignment4_Proj*, then run the makefile using the command below in shell:

### Steps for using the docker to compile the R markdown file

- 1. Change the current working directory to the location where you want the cloned directory to be, clone the *INFO550_FinalProject* repo from GitHub. 

```sh
$ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
```

- 2. Pull down the container image to local. The link to this docker repo on Docker Hub is [here](https://hub.docker.com/r/shijbian/final_project).

```sh
docker pull shijbian/final_project
```

- 3. If you want prrefer to retrieve the html report at your local diectory, you can create a folder in your local directory. In the example here, I created a folder called *docker_output* under *Desktop*. The 
docker container is final_project that has been pulled from the docker hub. The html will be rretrived unde  */INFO550_FinalProject/output/*, and it  will be mounted simultaneously at yourr local repo  *~/Desktop/docker_output*.

```sh
docker run -v ~/Desktop/docker_output:/INFO550_FinalProject/output final_project
```

- 4. If you prefer to retrive the folder on docker, you can run the code below from terminal:

```sh
$ docker run -it final_project /bin/bash
# make -f Makefile
```

## Extra Notes for Working Pipeline


- 1. Build the docker image `final_project` at the local director

```sh
docker build -t final_project .
```

It is normal to see a  warning message:

```sh
Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

- 2. Logged into the interactive terminal of the docker:

```sh
docker run -it final-project /bin/bash
```

You should be able to see the folder /INFO550_FinalProject/.

- 3. Mounted the directory for /INFO550_FinalProject/Rmd

```sh
docker run -v ~/Dropbox/Emory\ Courses/Fall\ 2021/INFO\ 550/INFO550_FinalProject/Rmd:/INFO550_FinalProject/Rmd -it final-project
```


## Data
The data used in this project is provided by Kaggle competition "[RSNA-MICCAI Brain Tumor
Radiogenomic Classification](https://www.kaggle.com/c/rsna-miccai-brain-tumor-radiogenomic-classification/overview)".

