FROM uribo/ramora:latest

RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    fonts-font-awesome \
    libmagick++-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ARG GITHUB_PAT

RUN set -x && \
  echo "GITHUB_PAT=$GITHUB_PAT" >> /usr/local/lib/R/etc/Renviron

RUN set -x && \
  install2.r --error --repos 'http://mran.revolutionanalytics.com/snapshot/2020-04-20' \
    carbonate \
    estatapi \
    extrafont \ 
    jpndistrict \
    jpmesh \ 
    kokudosuuchi \
    magick \
    rnaturalearth \
    zipangu && \
  installGithub.r \
    "ropenscilabs/rnaturalearthhires" && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds
