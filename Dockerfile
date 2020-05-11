FROM ubuntu:16.04

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/rsettlag" \
      maintainer="Robert Settlage <rsettlag@vt.edu>"

RUN apt-get update && apt-get install -y mesa-utils wget

RUN cd / && wget http://portal.nersc.gov/project/visit/releases/2.12.3/visit2_12_3.linux-x86_64-ubuntu14.tar.gz && \
    tar xzf visit2_12_3.linux-x86_64-ubuntu14.tar.gz && rm -r visit2_12_3.linux-x86_64-ubuntu14.tar.gz
    
## need to migrate to this: https://github.com/visit-dav/visit/releases/download/v3.1.1/build_visit3_1_1

RUN apt-get -y install libsm6 libxt6 libglu1-mesa

ENV QT_X11_NO_MITSHM 1

CMD ["/visit2_12_3.linux-x86_64/bin/visit"]
