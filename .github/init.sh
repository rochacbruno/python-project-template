#!/usr/bin/env bash
overwrite_template_dir=0

while getopts t:o flag
do
    case "${flag}" in
        t) template=${OPTARG};;
        o) overwrite_template_dir=1;;
    esac
done

if [ -z "${template}" ]; then
    echo "Available templates: flask"
    read -p "Enter template name: " template
fi

repo_urlname=$(basename -s .git `git config --get remote.origin.url`)
repo_name=$(basename -s .git `git config --get remote.origin.url` | tr '-' '_' | tr '[:upper:]' '[:lower:]')
repo_owner=$(git config --get remote.origin.url | awk -F ':' '{print $2}' | awk -F '/' '{print $1}')
echo "Repo name: ${repo_name}"
echo "Repo owner: ${repo_owner}"
echo "Repo urlname: ${repo_urlname}"

if [ -f ".github/workflows/rename_project.yml" ]; then
    .github/rename_project.sh -a "${repo_owner}" -n "${repo_name}" -u "${repo_urlname}" -d "Awesome ${repo_name} created by ${repo_owner}"
fi

function download_template {
    rm -rf "${template_dir}"
    mkdir -p .github/templates
    git clone "${template_url}" "${template_dir}"
}

echo "Using template:${template}"
template_url="https://github.com/rochacbruno/${template}-project-template"
template_dir=".github/templates/${template}"
if [ -d "${template_dir}" ]; then
    # Template directory already exists
    if [ "${overwrite_template_dir}" -eq 1 ]; then
        # user passed -o flag, delete and re-download
        echo "Overwriting ${template_dir}"
        download_template
    else
        # Ask user if they want to overwrite
        echo "Directory ${template_dir} already exists."
        read -p "Do you want to overwrite it? [y/N] " -n 1 -r
        echo 
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "Overwriting ${template_dir}"
            download_template
        else
            # User decided not to overwrite
            echo "Using existing ${template_dir}"
        fi
    fi
else
    # Template directory does not exist, download it
    echo "Downloading ${template_url}"
    download_template
fi

echo "Applying ${template} template to this project"}
./.github/templates/${template}/apply.sh -a "${repo_owner}" -n "${repo_name}" -u "${repo_urlname}" -d "Awesome ${repo_name} created by ${repo_owner}"

# echo "Removing temporary template files"
# rm -rf .github/templates/${template}

echo "Done! review, commit and push the changes"
