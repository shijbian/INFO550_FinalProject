## INFO 550 Final Project

### Introduction

This is the project repo for INFO550 final project in Fall 2021. 

The goal of this analysis is to improve the diagnosis of giloblastoma by defining the genetic subtype of giloblastoma using MRI imaging scan. The data is composed with a training set (N = 585) and a testing set (N = 87). The subject-level MGMT promoter methylation value for the training set is also provided in the csv file *train_labels.csv*. The model performance will be evaluated by predicting the hidden label of the testing set. The data size is 136.85 GB.

*INFO550_FinalProject* is the name of the project repository. The data are stored under the folder /Data. The R markdown file you will knit is /Rmd/report.Rmd.

*shijbian/final_project:latest* is the container name on Docker. *latest* is the default container tag.

To intall the docker image and knit the R Markdown file, you will can follow the steps from sections below.

### Environment

The docker image was built and tested on Mac Monterey V.12.0.1 with **Intel Chip**. 


### Issues encountered while using Mac Monterey V.12.0.1 with Apple M1 Chip

I still have problem finding out how to retrive the output on Mac with Apple M1 chip. Pnadoc was not properly initiated in Docker container on Mac with Apple M1 chip. 

A warning message can be thrown out when build the docker:

```sh
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested.
```

It seems that there is no problem running R and installing R packages using iteractive session from Docker Container on Mac M1 Chip. However, there is problem knitting RMarkdown. The error message is below

```sh
Error in strsplit(info, "\n")[[1]] : subscript out of bounds
Calls: render ... pandoc_available -> find_pandoc -> lapply -> FUN -> get_pandoc_version
In addition: Warning message:
In system(paste(shQuote(path), "--version"), intern = TRUE) :
  running command ''/usr/local/bin/pandoc' --version' had status 137
Execution halted
make: *** [Makefile:2: report] Error 1
```

### Steps for using the docker to compile the R markdown file

0. Make sure the docker is running on the local desktop.

1. Change the current working directory to the location where you want the cloned directory to be, clone the *INFO550_FinalProject* repo from GitHub. Depends on your labtop setting, you can clone the repo from my [github repo](https://github.com/shijbian/INFO550_FinalProject) using:

```sh
$ git clone https://github.com/shijbian/INFO550_FinalProject.git
```

Or,

```sh
$ git clone git@github.com:shijbian/INFO550_FinalProject.git
```

**Note:** You can skip step 1: I do not think you need to download the repo to your local directory in order to run the docker image. 


2. Pull down the container image to local. The link to this docker repo on Docker Hub is [here](https://hub.docker.com/r/shijbian/final_project). It will take around 5 min to pull the docker contaner from Docker Hub.

```sh
docker pull shijbian/final_project
```

3. If you want prrefer to retrieve the html report at your local diectory, you can create a folder in your local directory. In the example here, I created a folder called *docker_output* under *Desktop*. The docker container is called final_project that has been pulled from the docker hub. The html will be retrived under  */INFO550_FinalProject/output/*, and it  will be mounted simultaneously at your local repo at *~/Desktop/docker_output*. 


```sh
$ docker run -v ~/Desktop/docker_output:/INFO550_FinalProject/output shijbian/final_project
```

4. If you prefer to retrive the folder on docker, you can run the code below from terminal. The html file could be retrived at `# cd output`

```sh
$ docker run -it shijbian/final_project /bin/bash
# make -f Makefile
```

Or you can simply run this

```sh
$ docker run -it shijbian/final_project
```

In  the  end, you will see  a  warning  message as below, but it is totally normal:

```sh
In grSoftVersion() :
  unable to load shared object '/usr/local/lib/R/modules//R_X11.so':
  libXt.so.6: cannot open shared object file: No such file or directory
```

**NOTE: It might needs around 15 minutes to knit the html due to the large data size (2.3GB).**


## Extra Notes for Working Pipeline (Memo for myself)


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

- 4. See existing docker 

```sh
docker ps
```

## Data
The data used in this project is provided by Kaggle competition "[RSNA-MICCAI Brain Tumor
Radiogenomic Classification](https://www.kaggle.com/c/rsna-miccai-brain-tumor-radiogenomic-classification/overview)".

