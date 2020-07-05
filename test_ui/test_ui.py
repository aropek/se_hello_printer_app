from selenium import webdriver
import unittest
import time
import pytest


@pytest.mark.uitest
class TestSimpleSelenium(unittest.TestCase):
    def test_just_open(self):
        driver = webdriver.Chrome()
        driver.get("http://127.0.0.1:5000/ui")
        time.sleep(10) # nie umieszczać w github-ie
        driver.quit()
#
# class Timer(object):
#     def __init__(self, verbose=False):
#         self.verbose = verbose
#     def __enter__(self):
#         self.start = time.time()
#         return self
#     def __exit__(self, *args):
#         self.end = time.time()
#         self.secs = self.end - self.start
#         self.msecs = self.secs * 1000 # millisecs
#         if self.verbose:
#             print('elapsed time: %f ms' % self.msecs)
#
# funkcja_uruchamiajaca_testy = PYTHONPATH=. py.test --verbose -s --cov=.
# with Timer() as t:
#     funkcja_uruchamiajaca_testy()
# print("=> czas wymagany na test: {0} s".format(t.secs)
