FROM uribo/ramora:latest

RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    fonts-font-awesome && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  install2.r --error \
    extrafont \ 
    here \
    jpmesh \
    jpndistrict && \
  installGithub.r \
    "tidyverse/ggplot2" \
    "uribo/sessiondiverge"
