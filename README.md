# Python ML

**Docker Image**|[quantmind/pyml](https://hub.docker.com/r/quantmind/pyml/)
--- | ---
**Source code**|[quantmind/pyml](https://github.com/quantmind/pyml)
**Created by**|[Quantmind](http://quantmind.com/)

Data analysis and machine learning with python 3.

Usage:
```
docker pull quantmind/pyml
docker run --rm --name pyml -it quantmind/pyml /bin/bash
```
To show packages installed:
```
docker run --rm quantmind/pyml python info.py
```

Contains **Python 3.5.2** with the following libraries.

## Math & statistics

* [numpy](http://www.numpy.org/)
* [scipy](https://www.scipy.org/)
* [pandas](http://pandas.pydata.org/)

## Processing & Parsers

* [lxml](http://lxml.de/)
* [Pillow](https://python-pillow.org/)
* [Tesseract-ocr](https://github.com/tesseract-ocr/tesseract)

## Database

* [psycopg2](http://initd.org/psycopg/docs/)
* [pytables](http://www.pytables.org/)

## Machine Learning

* [scikit-learn](http://scikit-learn.org)
* [Theano](https://github.com/Theano/Theano)
* [Tensorflow](https://www.tensorflow.org/)
* [Vowpal Wabbit](https://github.com/JohnLangford/vowpal_wabbit) (not available)
* [XGBoost](https://xgboost.readthedocs.io/en/latest/)

