import unittest

from keras.models import Sequential
from keras.layers import Dense, Activation


class TestTF(unittest.TestCase):

    def test_model(self):
        model = Sequential()
        model.add(Dense(units=64, input_dim=100))
        model.add(Activation('relu'))
        model.add(Dense(units=10))
        model.add(Activation('softmax'))
