.PHONY: all venv dependencies cython

ifeq ($(OS),Windows_NT)
    VENV_PYTHON := .venv\Scripts\python.exe
    VENV_PIP := .venv\Scripts\pip.exe
    VENV_PYTHON_FROM_ALMIGHTY := ..\$(VENV_PYTHON)
else
    VENV_PYTHON := .venv/bin/python
    VENV_PIP := .venv/bin/pip
    VENV_PYTHON_FROM_ALMIGHTY := ../$(VENV_PYTHON)
endif

all: venv dependencies cython

venv:
	python -m venv .venv

dependencies:
	$(VENV_PIP) install -r requirements.txt

cython:
	cd almighty && $(VENV_PYTHON_FROM_ALMIGHTY) setup.py build_ext --inplace