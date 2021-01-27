#!/bin/bash

# Jack C. Cook
# Friday, December 25, 2020

# Request the path to the directory of files to be listed
read -p "Provide the path to a directory of files you want listed: " path

# Request the number of times it will be repeated
read -p "How many times do you want each file listed?: " num

# Trim off the quotation marks that linux places around file paths
path=${path#"'"}
path=${path%"'"}
echo $path

# The text file that the files will be placed into
output_path=$path$".txt"

echo "The files will be listed in the file: ${output_path}"
for entry in "$path"/*
do
  for i in `seq 1 $num`
  do
    echo "$entry" >> $output_path
  done
done
