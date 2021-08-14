
> HOW TO USE THIS TEMPLATE

1. Click on 'Use this template' or go to https://github.com/rochacbruno/python-project-template/generate
2. Wait until the first run of CI finishes (Github Actions will process the template and commit to your new repo)
3. If you want coverage reports and automatic release to PyPI
  On repository `settings->secrets` add your `PIPY_API_TOKEN` and `CODECOV_TOKEN` (get the tokens on respective websites)
4. Read the file `CONTRIBUTING.md`
5. Then clone your new project and start coding!

What is included?

- A full feature Makefile with common targets to:
  - lint all python files
  - run all tests
  - run all tests and coverage report
  - format code using black
  - run mypy
  - release to github and pypi
  - create a virtualenv and install project for development
- A basic project structure with
  - `.gitignore`
  - Github Actions CI
  - `setup.py` with common parameters
  - Changelog generation
  - basic test structure using `pytest`
  - Entry point to run `$ project_name`
  - Entry point to run `$ python -m project_name`
- Basic documentation structure using `mkdocs`
- Integration with `codecov` and `pypi`

> Delete all lines above this ^^^

---
# project_name

[![codecov](https://codecov.io/gh/author_name/project_name/branch/main/graph/badge.svg?token=I9ZGCFTQT9)](https://codecov.io/gh/author_name/project_name)
[![CI](https://github.com/author_name/project_name/actions/workflows/main.yml/badge.svg)](https://github.com/author_name/project_name/actions/workflows/main.yml)

project_description

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

Read the [CONTRIBUTING.md](CONTRIBUTING.md) file.
