FROM python:3.7-buster

RUN \
    apt-get update

# Install R
RUN \
    apt-get install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common build-essential

RUN \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

RUN \
    apt-get install -y r-base

RUN \
    R --version

COPY dependencies.R /dependencies.R

RUN \
  Rscript /dependencies.R

RUN apt-get update && \
    apt-get install -y build-essential cmake && \
    git clone --recursive --branch stable --depth 1 https://github.com/Microsoft/LightGBM && \
    cd LightGBM && \
    Rscript build_r.R