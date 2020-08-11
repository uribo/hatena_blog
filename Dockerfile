FROM uribo/ramora@sha256:f2ded1c5ae273fb146045079b13c64631a14dc2b4ef0f62b9af43cc61f1cc8d9

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
  install2.r --error --ncpus -1 --repos 'https://mran.revolutionanalytics.com/snapshot/2020-08-11' \
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
