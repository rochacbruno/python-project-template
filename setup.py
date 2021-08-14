"""Python setup.py for project_name package"""
from pathlib import Path

from setuptools import find_packages, setup

setup(
    name="project_name",
    version="0.1.0",
    description="Some objects could be project_name",
    url="https://github.com/yourname/project_name/",
    long_description=Path("README.md").read_text(),
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
