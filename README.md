
> HOW TO USE THIS TEMPLATE

- click on 'Use this template' or go to https://github.com/rochacbruno/python-project-template/generate
- If you want coverage reports and release to PiPy
  On repository settings->secrets add your PIPY_API_TOKEN and CODECOV_TOKEN
- Then clone your new project and adjust for your needs
- Replace `project_name` with the name of your project
- Replace `yourname` with your github username
- Edit setup.py to adjust your project information

> Delete all lines above this
# ProjectName

[![codecov](https://codecov.io/gh/yourname/project_name/branch/main/graph/badge.svg?token=I9ZGCFTQT9)](https://codecov.io/gh/yourname/project_name)
[![CI](https://github.com/yourname/project_name/actions/workflows/main.yml/badge.svg)](https://github.com/yourname/project_name/actions/workflows/main.yml)

This is an awesome project.

## Install it from PyPI

```bash
pip install project_name
```

## Usage

```py
from project_name import BaseClass
from project_name import base_function

BaseClass().base_method()
base_function()
```

```bash
$ python -m project_name
#or
$ project_name
```

## Development

```bash 
❯ make
Usage: make <target>

Targets:
help:             ## Show the help.
install:          ## Install the project in dev mode.
fmt:              ## Format code using black & isort.
lint:             ## Run pep8, black, mypy linters.
test: lint        ## Run tests and generate coverage report.
watch:            ## Run tests on every change.
clean:            ## Clean unused files.
release:          ## Create a new release on github.
```
