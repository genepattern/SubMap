# copyright 2017-2018 Regents of the University of California and the Broad Institute. All rights reserved.

FROM r-base:4.2.1

RUN mkdir /build


COPY sources.list /etc/apt/sources.list
COPY Rprofile.gp.site ~/.Rprofile
COPY Rprofile.gp.site /usr/lib/R/etc/Rprofile.site
COPY install_stuff.R /build/source/install_stuff.R
RUN Rscript /build/source/install_stuff.R

RUN mkdir /submap
COPY src/* /submap/

 

