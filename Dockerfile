FROM python:3.5.2

# Install packages
RUN apt-get update -qq

RUN apt-get install -yq --no-install-recommends \
    apt-utils

RUN apt-get install -yq --no-install-recommends \
    build-essential \
    libhdf5-dev \
    liblzo2-dev \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    gfortran \
    libblas-dev \
    liblapack-dev \
    tesseract-ocr


# RUN apt-get autoremove -yq

# Install python packages
ADD requirements.txt .
RUN pip install -r requirements.txt


# TENSORFLOW
RUN pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.9.0-cp35-cp35m-linux_x86_64.whl

# INSTALL https://github.com/JohnLangford/vowpal_wabbit
RUN apt-get install -yq --no-install-recommends \
    clang \
    libboost-program-options-dev \
    zlib1g-dev

RUN git clone git://github.com/JohnLangford/vowpal_wabbit.git
WORKDIR /vowpal_wabbit
RUN ./autogen.sh
RUN make CXX=clang++
RUN make test
RUN make install
WORKDIR /
RUN rm -rf vowpal_wabbit

# INSTALL XGBOOST
RUN git clone --recursive https://github.com/dmlc/xgboost
WORKDIR /xgboost
RUN make -j4
RUN mv xgboost /usr/local/bin
WORKDIR /xgboost/python-package
RUN python setup.py install
WORKDIR /
RUN rm -rf xgboost
