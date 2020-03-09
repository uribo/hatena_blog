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
  install2.r --error --skipinstalled --repos 'http://mran.revolutionanalytics.com/snapshot/2020-01-11' \
    carbonate \
    estatapi \
    extrafont \ 
    kokudosuuchi \
    magick \
    rnaturalearth && \
  installGithub.r \
    "ropenscilabs/rnaturalearthhires" \
    "uribo/jpmesh" \
    "uribo/jpndistrict" && \
  Rscript -e 'webshot::install_phantomjs()' && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds

ENV PATH $PATH:/root/bin/phantomjs

RUN set -x && \
  mv /root/bin/phantomjs /usr/local/bin/phantomjs
