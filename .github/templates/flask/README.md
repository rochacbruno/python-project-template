# project_name Flask Application

This is a Flask application.

## Installation

From source:

```bash
git clone https://github.com/author_name/project_urlname
cd project_name
make install
```

From pypi:

```bash
pip install project_name
```

## Executing

This application has a CLI interface that extends the Flask CLI.

Just run:

```bash
$ project_name
```

or

```bash
$ python -m project_name
```

To see the help message and usage instructions.

## First run

```bash
project_name create-db   # run once
project_name populate-db  # run once (optional)
project_name add-user -u admin -p 1234  # ads a user
project_name run
```

Go to:

- Website: http://localhost:5000
- Admin: http://localhost:5000/admin/
  - user: admin, senha: 1234
- API GET:
  - https://localhost:5000/api/v1/product/
  - https://localhost:5000/api/v1/product/1
  - https://localhost:5000/api/v1/product/2
  - https://localhost:5000/api/v1/product/3


> **Note**: You can also use `flask run` to run the application.
