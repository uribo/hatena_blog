FROM uribo/ramora:latest

RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    fonts-font-awesome \
    libmagick++-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  install2.r --error \
    extrafont \ 
    kokudosuuchi \
    magick && \
  installGithub.r \
    "tidyverse/ggplot2" \
    "uribo/sessiondiverge" \
    "uribo/jpmesh" \
    "uribo/jpndistrict" && \
  Rscript -e 'webshot::install_phantomjs()'

ENV PATH $PATH:/root/bin/phantomjs

RUN set -x && \
  mv /root/bin/phantomjs /usr/local/bin/phantomjs
