#!/bin/sh

# relies on python being installed w/ pip, virtualenv, virtualenvwrapper
mkvirtualenv globals
workon globals
pip install neovim python-language-server
