#!/usr/bin/env bash
while getopts a:n:u:d: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        n) name=${OPTARG};;
        u) urlname=${OPTARG};;
        d) description=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Project Name: $name";
echo "Project URL name: $urlname";
echo "Description: $description";

echo "Rendering the Flask template..."
original_author="author_name"
original_name="project_name"
original_urlname="project_urlname"
original_description="project_description" 
for filename in $(find -name "*.*" -not \( -path "./.git*" -prune \) -not \( -path "./apply.sh" -prune \)) 
do
    sed -i "s/$original_author/$author/g" $filename
    sed -i "s/$original_name/$name/g" $filename
    sed -i "s/$original_urlname/$urlname/g" $filename
    sed -i "s/$original_description/$description/g" $filename
    echo "Renamed $filename"
done

# Add requirements
if [ ! -f pyproject.toml ]
then
    cat .github/templates/flask/requirements.txt >> requirements.txt
    cat .github/templates/flask/requirements-test.txt >> requirements-test.txt
else
    for item in $(cat .github/templates/flask/requirements.txt)
    do
        poetry add "${item}"
    done
    for item in $(cat .github/templates/flask/requirements-test.txt)
    do
        poetry add --dev "${item}"
    done
fi

# Move module files
rm -rf "${name}"
rm -rf tests
cp -R .github/templates/flask/project_name "${name}"
cp -R .github/templates/flask/tests tests

cp .github/templates/flask/README.md README.md
cp .github/templates/flask/wsgi.py wsgi.py
cp .github/templates/flask/.env .env
cp .github/templates/flask/settings.toml settings.toml

# install
make clean

if [ ! -f pyproject.toml ]
then
    make virtualenv
    make install
    echo "Applied Flask template"
    echo "Ensure you activate your env with 'source .venv/bin/activate'"
    echo "then run project_name or python -m project_name"
else
    poetry install
    echo "Applied Flask template"
    echo "Ensure you activate your env with 'poetry shell'"
    echo "then run project_name or python -m project_name or poetry run project_name"
fi
