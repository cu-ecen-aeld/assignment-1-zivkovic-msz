#!/bin/bash
# Accepts the following arguments: the first argument is a full path 
# to a file (including filename) on the filesystem, referred to below as writefile; 
# the second argument is a text string which will be written within this file, referred to below as writestr
# Exits with value 1 error and print statements if any of the arguments above were not specified
# Creates a new file with name and path writefile with content writestr, overwriting any existing 
# file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if 
# the file could not be created.
# Author: Mihailo Zivkovic

writefile=$1
writestr=$2

function usage {
    echo
    echo "$( basename "$0" ): Write text string to target file."
    echo 
    echo "Syntax: $( basename "$0" ) <full path to file> <text string>"
    echo
}

if [ $# -ne 2 ]
then
    echo "Error: Incorrect number of arguments ($#). Expected 2."
    usage
    exit 1  
fi

# Create or overwrite existing file
echo "$writestr" > $writefile

# Check if file was created
if [ ! -e  $writefile ]
then
    echo "Error could not make file $writefile."
    exit 1
fi

exit 0