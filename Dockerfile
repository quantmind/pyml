FROM python

LABEL maintainer Quantmind


WORKDIR /pyml
ADD info.py /pyml/info.py
ADD requirements.txt /pyml/requirements.txt
ADD setup.cfg /pyml/setup.cfg


# Install packages
RUN apt-get update -yq \
    && apt-get install -yq --no-install-recommends \
        build-essential \
        pkg-config \
        libhdf5-dev \
        liblzo2-dev \
        libpq-dev \
        libxml2-dev \
        libxslt1-dev \
        gfortran \
        libblas-dev \
        liblapack-dev \
        tesseract-ocr \
        libtesseract-dev \
        libleptonica-dev \
    && rm -rf /var/lib/apt/lists/*


# PYTHON PACKAGES
RUN pip install -U pip \
    && pip install cython \
    && pip install -r requirements.txt


# XGBOOST
RUN git clone --recursive https://github.com/dmlc/xgboost \
    && cd xgboost \
    && make -j4 \
    && mv xgboost /usr/local/bin \
    && cd python-package \
    && python setup.py install \
    && cd ../.. \
    && rm -rf xgboost


# Vowpal Wabbit
RUN git clone git://github.com/JohnLangford/vowpal_wabbit.git \
    && apt-get update -yq
    && apt-get install -yq --no-install-recommends \
        libboost-program-options-dev \
        zlib1g-dev \
        libboost-python-dev \
        libvw0 \
    && cd vowpal_wabbit \
    && ./autogen.sh \
    && make \
    && make test \
    && make install \
    && cd ..
    && rm -rf vowpal_wabbit \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN rm -rf /root/.cache \
    && python info.py
