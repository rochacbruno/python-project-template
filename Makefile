.ONESHELL:

.PHONY: help
help:             ## Show the help.
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@fgrep "##" Makefile | fgrep -v fgrep

.PHONY: install
install:          ## Install the project in dev mode.
	pip install -e .[test]

.PHONY: fmt
fmt:              ## Format code using black & isort.
	isort project_name/
	black -l 79 project_name/

.PHONY: lint
lint:             ## Run pep8, black, mypy linters.
	flake8 project_name/
	black -l 79 --check project_name/
	mypy project_name/

.PHONY: test
test: lint        ## Run tests and generate coverage report.
	pytest -v --cov-config .coveragerc --cov=project_name -l --tb=short --maxfail=1 tests/
	coverage xml
	coverage html

.PHONY: watch
watch:            ## Run tests on every change.
	ls **/**.py | entr pytest -s -vvv -l --tb=long --maxfail=1 tests/

.PHONY: clean
clean:            ## Clean unused files.
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '__pycache__' -exec rm -rf {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	rm -rf .cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
	rm -rf htmlcov
	rm -rf .tox/
	rm -rf docs/_build

.PHONY: virtualenv
virtualenv:       ## Create a virtual environment.
	@echo "creating virtualenv ..."
	@rm -rf .venv
	@python3 -m venv .venv
	@./.venv/bin/pip install -U pip
	@./.venv/bin/pip install -e .[test]
	@echo
	@echo "!!! Please run 'source .venv/bin/activate' to enable the environment !!!"

.PHONY: release
release:          ## Create a new tag for release.
	@read -p "tag? : " TAG
	@echo "creating git tag : $${TAG}"
	@git tag $${TAG}
	@gitchangelog > HISTORY.md
	@git add HISTORY.md
	@git commit -m "release: version $${TAG}"
	@git push -u origin HEAD --tags
	@echo "Github Actions will detect the new tag and release the new version."
