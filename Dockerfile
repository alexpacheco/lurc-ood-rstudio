FROM centos:8

Label "maintainer"="alp514@lehigh.edu" \
      "os"="CentOS 8" \
      "compiler"="GCC 8.3.0" \
      "app"="R 4.0.2" \
      "app"="RStudio 1.3.1056" \
      "description"="R 4.0.2 and RStudio 1.2.1335" 

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
 && yum install -y glibc-langpack-en \
 && sed -i.bak -e 's/enabled=0/enable=1/g' /etc/yum.repos.d/CentOS-PowerTools.repo \
 && yum -y install epel-release wget \
 && mkdir -p /opt/tmp && cd /opt/tmp \
 && wget http://repo.okay.com.mx/centos/8/x86_64/release/v8-6.7.17-8.el8.x86_64.rpm http://repo.okay.com.mx/centos/8/x86_64/release/v8-devel-6.7.17-8.el8.x86_64.rpm
RUN yum -y install which libgit2-devel libssh2-devel cargo bzip2 bzip2-devel cairo cairo-devel \
       cargo curl curl-devel gcc gcc-c++ gcc-gfortran java-1.8.0-openjdk java-1.8.0-openjdk-devel \
       ImageMagick-c++ ImageMagick-c++-devel libRmath-devel \
       java-1.8.0-openjdk-headless libgit2-devel libjpeg-turbo libjpeg-turbo-devel libpng libpng-devel \
       libxml2 libxml2-devel openssl openssl-devel compat-openssl10 readline readline-devel libICE \
       libicu libicu-devel libssh2-devel libtiff libtiff-devel libX11-devel libXt-devel \
       pcre pcre-devel texlive-dvips texlive-collection-latexrecommended tcl tcl-devel tk tk-devel \
       which wget xz-libs xz-devel zlib zlib-devel xorg-x11-server-devel \
       mariadb mariadb-devel postgresql postgresql-devel unixODBC-devel.x86_64 \
       gdal gdal-devel proj proj-devel geos geos-devel libsq3-devel udunits2-devel \
       gsl gsl-devel netcdf-devel poppler-cpp-devel \
       v8-6.7.17-8.el8.x86_64.rpm v8-devel-6.7.17-8.el8.x86_64.rpm

# Install R 4.0.2
RUN cd /opt/tmp \
 && wget http://lib.stat.cmu.edu/R/CRAN/src/base/R-4/R-4.0.2.tar.gz \
 && tar -xvzf R-4.0.2.tar.gz \
 && cd R-4.0.2 \
 && ./configure --enable-memory-profiling --enable-R-profiling --enable-R-shlib \
 && make \
 && make install
# Install RStudio 1.2.1335
RUN cd /opt/tmp \
 && wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.2.1335-x86_64.rpm \
 && yum -y install rstudio-server-rhel-1.2.1335-x86_64.rpm \
 && cd /opt \ 
 && rm -rf tmp \
 && rm -rf /var/cache/yum \
 && yum clean all

# Set default repo
RUN (echo ' ' \
 echo 'local({' \
 echo '    r <- getOption("repos")' \
 echo '    r["CRAN"] <- "http://lib.stat.cmu.edu/R/CRAN"' \
 echo '    options(repos=r)' \
 echo '})' \
 echo ' ' ) >> /usr/local/lib64/R/library/base/R/Rprofile \


