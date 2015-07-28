# Preinstall the NGCHM R library into an rstudio container.

# To run:
# - Follow the instructions at https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image
#   but substitute bmbroom/rstudio-ngchm for the name of the docker image.
# - Open the rstdio port (default 8787) in your browser and login (default rstudio/rstudio).
# - Load the NGCHM library: library(NGCHM)
# - Connect to your NGCHM server (see https://github.com/bmbroom/NGCHMR/blob/master/README.md
#   for pointers to documentation).

FROM rocker/rstudio

MAINTAINER Bradley Broom <bmbroom@mdanderson.org>

RUN apt-get update && apt-get -y install libxml2-dev openjdk-7-jre-headless && apt-get -y clean

COPY install.R /tmp/install.R

RUN Rscript /tmp/install.R && /bin/rm /tmp/install.R
