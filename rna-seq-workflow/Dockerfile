FROM r-base

RUN apt-get update -qq && apt-get -y install libssl-dev && apt-get -y install libffi-dev
RUN apt-get install -y net-tools && apt-get install -y libcurl4-openssl-dev && apt-get install -y libxml2-dev

RUN Rscript -e 'install.packages(c("dplyr", "tidyr", "readr","plyr","optparse","BiocManager","R.utils"))'

RUN Rscript -e "BiocManager::install()"
RUN Rscript -e "install.packages('synapser', repos=c('http://ran.synapse.org', 'http://cran.fhcrc.org'))"
RUN Rscript -e "BiocManager::install('biomaRt',update=TRUE,ask=FALSE)"

COPY steps/merge-files-with-meta.R /usr/local/bin/merge-files-with-meta.R

RUN chmod 777 /usr/local/bin/merge-files-with-meta.R

ENV PATH="/usr/local/bin:${PATH}"
