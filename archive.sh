#!/usr/bin/env bash

DOMAIN=''
# https://gist.github.com/jonsuh/3c89c004888dfc7352be
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

display_usage() {
  echo "This script archives websites."
  echo "${YELLOW}\nUsage:\n\t archive.sh [URL]\n${NOCOLOR}"
  echo "${GREEN}\nExample: ./archive.sh https://forum2020.diglib.org/${NOCOLOR} \n"
}

domain_from_url(){
  echo $1 | cut -d'/' -f3
}

if [ $# == 0 ]
then
  display_usage
  exit 1
fi

# check whether user had supplied -h or --help . If yes display usage
if [[ ( $# == "--help") ||  $# == "-h" ]]
then
	display_usage
	exit 0
fi

echo "${GREEN}Archiving $1${NOCOLOR}"

DOMAIN=$(domain_from_url $1)

# from https://www.petekeen.net/archiving-websites-with-wget
cmd="wget \
  --mirror \
  --warc-file=${DOMAIN} \
  --warc-cdx \
  --page-requisites
  --html-extension \
  --convert-links \
  --execute robots=off \
  --directory-prefix=. \
  --span-hosts \
  --domains=${DOMAIN} \
  --random-wait \
  ${1}"
eval $cmd

mv ${DOMAIN} docs

echo "${GREEN}Finished Archiving $1"
echo "\n Files are in docs directory."
echo "\n You can run php -S localhost:8000 in the docs directory to validate the files. ${NOCOLOR}"
