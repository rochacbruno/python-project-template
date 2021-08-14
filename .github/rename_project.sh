#!/usr/bin/env bash
while getopts a:n:d: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        n) name=${OPTARG};;
        d) description=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Project Name: $name";
echo "Description: $description";

echo "Renaming project..."

original_name="project_name"
original_author="author_name"
original_description="project_description"


# for filename in $(find . -name "*.*") 
for filename in $(git ls-files) 
do
    sed -i "s/$original_author/$author/g" $filename
    sed -i "s/$original_name/$name/g" $filename
    sed -i "s/$original_description/$description/g" $filename
    echo "Renamed $filename"
done

mv project_name $name

# This command runs only once!
rm -rf .github/rename_project.sh
