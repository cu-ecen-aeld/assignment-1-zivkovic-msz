#!/bin/bash
# Accepts the following runtime arguments: 
# the first argument is a path to a directory on the filesystem, referred to below as filesdir; 
# the second argument is a text string which will be searched within these files, referred to below as searchstr
# 
# Exits with return value 1 error and print statements if any of the parameters above were not specified
# 
# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
#
# Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files 
# in the directory and all subdirectories and Y is the number of matching lines found in respective files.
# Author: Mihailo Zivkovic

filesdir=$1
searchstr=$2

function usage {
    echo
    echo "$( basename "$0" ): Searches instances of text string within directory."
    echo 
    echo "Syntax: $( basename "$0" ) <path to directory> <text string>"
    echo
}

if [ $# -ne 2 ]
then
    echo "Error: Incorrect number of arguments ($#). Expected 2."
    usage
    exit 1    
elif [ ! -d $1 ]
then
    echo "Error: $1 is not a valid directory on the filesystem."
    usage
    exit 1    
fi

num_files=$( grep -r -l $searchstr $filesdir/* | wc -l )
num_matching_lines=$( grep -r $searchstr $filesdir/* | wc -l )

echo "The number of files are $num_files and the number of matching lines are $num_matching_lines."