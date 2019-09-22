from flask import Flask

app = Flask(__name__)

from andrewrosss_dev import routes

from ._version import get_versions
__version__ = get_versions()['version']
del get_versions
