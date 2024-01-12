FROM ubuntu:jammy

#AUTHOR Francois Rainville <francois.rainville@martinrea.com>

RUN apt-get -y update && \
    apt-get -y install wget && \
    apt-get -y install zip &&\
	apt-get -y install unzip && \
	apt-get -y install tar && \
	apt-get -y install curl && \
    apt-get -y install git && \
    apt-get -y install ssh

# Install miniconda
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/miniconda && \
	ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# Install usefull python packages
RUN /opt/miniconda/bin/pip install crcmod && \
    /opt/miniconda/bin/pip install intelhex

COPY en.st-stm32cubeclt*amd64.sh.zip /tmp/

RUN unzip "/tmp/en.st-stm32cubeclt*amd64.sh.zip" -d /tmp && \
    find /tmp -name "en.st-stm32cubeclt*amd64.sh.zip" -type f -exec rm {} \; && \
    find /tmp -name "st-stm32cubeclt*amd64.sh" -type f -exec chmod +x {} \; && \
    sh -c '/tmp/st-stm32cubeclt*amd64.sh --tar -xvf -C /tmp'

COPY patch/setup.patch /tmp/

# Apply the patch to setup.sh
RUN cd /tmp && \
    patch -p0 < setup.patch

# Run the installer
RUN chmod +x /tmp/setup.sh && \
    cd /tmp &&\
    ./setup.sh

# Install vcpkg
RUN cd /root &&\
    /bin/bash -c ". <(curl https://aka.ms/vcpkg-init.sh -L)"

# remove temporary files
RUN rm -rf /tmp/*