FROM python:3.5.2

MAINTAINER Luca Sbardella <luca@quantmind.com>

ADD info.py .

# Install packages
RUN apt-get update -yq \
    && apt-get upgrade -yq \
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
        clang \
        libboost-program-options-dev \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*


RUN pip install pip cython \
    && pip install virtualenv \
        numpy \
        scipy \
        tables \
        psycopg2 \
        pandas \
        lxml \
        Pillow \
        scikit-learn \
        Theano \
    && pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.9.0-cp35-cp35m-linux_x86_64.whl


# VOWPAL WABBIT
RUN git clone git://github.com/JohnLangford/vowpal_wabbit.git \
    && cd vowpal_wabbit \
    && ./autogen.sh \
    && make CXX=clang++ \
    && make test \
    && make install \
    && cd .. \
    && rm -rf vowpal_wabbit


# XGBOOST
RUN git clone --recursive https://github.com/dmlc/xgboost \
    && cd xgboost \
    && make -j4 \
    && mv xgboost /usr/local/bin \
    && cd python-package \
    && python setup.py install \
    && cd ../.. \
    && rm -rf xgboost
