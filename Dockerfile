FROM uribo/ramora:latest

RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    fonts-font-awesome \
    libmagick++-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN set -x && \
  install2.r --error \
    estatapi \
    extrafont \ 
    kokudosuuchi \
    magick \
    rnaturalearth && \
  installGithub.r \
    "tidyverse/ggplot2" \
    "ropenscilabs/rnaturalearthhires" \
    "uribo/sessiondiverge" \
    "uribo/jpmesh" \
    "uribo/jpndistrict" \
    "yonicd/carbonate" && \
  Rscript -e 'webshot::install_phantomjs()' && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds

ENV PATH $PATH:/root/bin/phantomjs

RUN set -x && \
  mv /root/bin/phantomjs /usr/local/bin/phantomjs
