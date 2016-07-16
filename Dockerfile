FROM python:3.5.2

# Install packages
RUN apt-get update -qq
RUN apt-get upgrade -yq

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
    liblapack-dev


# Install python packages
ADD requirements-base.txt .
RUN pip install -U -r requirements-base.txt
ADD requirements.txt .
RUN pip install -r requirements.txt
RUN rm requirements-base.txt
RUN rm requirements.txt

# TESSERACT OCR
RUN apt-get install -yq --no-install-recommends \
    tesseract-ocr \
    libtesseract-dev \
    libleptonica-dev
RUN pip install tesserocr

# TENSORFLOW
RUN pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.9.0-cp35-cp35m-linux_x86_64.whl

# VOWPAL WABBIT
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

# XGBOOST
RUN git clone --recursive https://github.com/dmlc/xgboost
WORKDIR /xgboost
RUN make -j4
RUN mv xgboost /usr/local/bin
WORKDIR /xgboost/python-package
RUN python setup.py install
WORKDIR /
RUN rm -rf xgboost

RUN apt-get autoremove -yq
