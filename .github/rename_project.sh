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

original_name="project_name"
original_author="author_name"
original_description="project_description"


for filename in $(find . -name "*.*") 
do
    sed -i "s/$original_author/$author/" $filename
    sed -i "s/$original_name/$name/" $filename
    sed -i "s/$original_description/$description/" $filename
    echo "Renamed $filename"
done
