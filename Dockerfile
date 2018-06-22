FROM uribo/ramora

RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    fonts-font-awesome && \
  install2.r \
    extrafont \ 
    here \
    jpmesh \
    jpndistrict && \
  installGithub.r \
    "tidyverse/ggplot2" \
    "uribo/sessiondiverge"
