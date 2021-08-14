"""Python setup.py for project_name package"""
import io
import os
from setuptools import find_packages, setup


def read(*names, **kwargs):
    """Read a file."""
    content = ""
    with io.open(
        os.path.join(os.path.dirname(__file__), *names),
        encoding=kwargs.get("encoding", "utf8"),
    ) as open_file:
        content = open_file.read().strip()
    return content


setup(
    name="project_name",
    version="0.1.0",
    description="Some objects could be project_name",
    url="https://github.com/yourname/project_name/",
    long_description=read("README.md"),
    long_description_content_type="text/markdown",
    author="Your Name",
    packages=find_packages(exclude=["tests"]),
    install_requires=[],
    entry_points={
        "console_scripts": ["project_name = project_name.__main__:main"]
    },
    extras_require={
        "test": [
            "pytest",
            "coverage",
            "flake8",
            "black",
            "isort",
            "pytest-cov",
            "codecov",
            "mypy",
            "gitchangelog",
        ],
    },
)
