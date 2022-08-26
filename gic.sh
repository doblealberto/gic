#!/bin/bash
working_directory=$(pwd)
base_url="https://www.toptal.com/developers/gitignore/api/"
if [ ! -d "./git" ]; then
printf "You havent configured a git repo\n"
printf "repo init at ${working_directory} ...\n"
git init > /dev/null 2>&1
fi

[ $# -eq 0 ] && printf \
"\n You did not specify any technologies for your git ignore file!\n" \
&& exit 1

for technology in "$@"
do
    full_tec_url="$base_url$technology"
    printf "Adding $technology to .gitignore\n"
    `touch .gitignore`
    `wget $full_tec_url --output-document - >> .gitignore`
    
done
    