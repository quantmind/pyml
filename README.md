# Machine Learning with Python

**Docker Image**|[quantmind/pyml](https://hub.docker.com/r/quantmind/pyml/)
--- | ---
**Source code**|[quantmind/pyml](https://github.com/quantmind/pyml)
**Created by**|[Quantmind](http://quantmind.com/)
**CI**|[![CircleCI](https://circleci.com/gh/quantmind/pyml.svg?style=svg)](https://circleci.com/gh/quantmind/pyml)

Data analysis and machine learning with python 3.

Usage:
```
docker pull quantmind/pyml
docker run --rm --name pyml -it quantmind/pyml bash
```
To show packages installed:
```
docker run --rm quantmind/pyml python info.py
```

Contains **Python 3.6.1** with the following libraries.

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

* [scikit-learn](http://scikit-learn.org) - data analysis and manipulation in python
* [keras](https://github.com/fchollet/keras) - high-level neural networks API for [tensorflow] or [theano]
* [theano][] - evaluate mathematical expressions involving multi-dimensional arrays efficiently
* [tensorflow][] -  numerical computation using data flow graphs
* [vowpal wabbit](https://github.com/JohnLangford/vowpal_wabbit) - fast online learning code
* [XGBoost](https://xgboost.readthedocs.io/en/latest/) - optimized distributed gradient boosting library


[tensorflow]: https://www.tensorflow.org/
[theano]: https://github.com/Theano/Theano
