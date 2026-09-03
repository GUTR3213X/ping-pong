.PHONY: all venv dependencies cython

ifeq ($(OS),Windows_NT)
    VENV_PYTHON := .venv/Scripts/python.exe
    VENV_PIP := .venv/Scripts/pip.exe
else
    VENV_PYTHON := .venv/bin/python
    VENV_PIP := .venv/bin/pip
endif

all: venv dependencies cython

venv:
	python3 -m venv .venv

dependencies:
	$(VENV_PIP) install -r requirements.txt

cython:
	cd almighty && ../$(VENV_PYTHON) setup.py build_ext --inplace