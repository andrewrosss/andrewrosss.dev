# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.

import os
import sys
import sphinx_material

sys.path.insert(0, os.path.abspath("."))
sys.path.insert(0, os.path.abspath("../.."))


# -- Project information -----------------------------------------------------

project = "andrewrosss.dev"
copyright = "2019, Andrew Ross"
author = "Andrew Ross"

# The full release, including alpha/beta/rc tags
release = "0.1.0"


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.doctest",
    "sphinx.ext.napoleon",
    "sphinx.ext.autosectionlabel",
    "sphinx_material",
]
autosectionlabel_prefix_document = True

# Add any paths that contain templates here, relative to this directory.
templates_path = ["_templates"]

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = "sphinx_material"
# Get the them path
html_theme_path = sphinx_material.html_theme_path()
# Register the required helpers for the html context
html_context = sphinx_material.get_html_context()

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ["_static"]

html_logo = "_static/images/laptop_icon.svg"

html_sidebars = {"**": ["globaltoc.html", "localtoc.html", "searchbox.html"]}

html_title = project
html_short_title = project

html_theme_options = {
    "color_primary": "teal",
    "color_accent": "teal",
    # 'base_url': base_url,
    "repo_url": "https://github.com/andrewrosss/andrewrosss.dev",
    "repo_name": "andrewrosss.dev",
    "globaltoc_depth": 3,
    "globaltoc_collapse": True,
    "globaltoc_includehidden": True,
    "nav_title": f"{project} {release}".format(release),
    "master_doc": False,
    "nav_links": [
        {"href": "index", "internal": True, "title": "Home"},
        {
            "href": "https://github.com/andrewrosss",
            "internal": False,
            "title": "GitHub",
        },
    ],
    # 'heroes': {'index': 'statistical models, hypothesis tests, and data '
    #                     'exploration',
    #            'examples/index': 'examples and tutorials to get started with '
    #                              'statsmodels'
    # }
}
