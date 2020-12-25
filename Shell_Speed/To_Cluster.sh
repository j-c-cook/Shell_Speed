#!/bin/bash

# Jack C. Cook
# Thursday, December 24, 2020
# To_Cluster.sh - Transfer files to cluster via scp
# History: Goes back many months, just now cleaning up for teammates to use 

# Source the configuration file to collect all of the necessary variables 
source configuration.dat 

# Source (load) colors for text
# For information on coloring text: https://stackoverflow.com/a/28938235/11637415 
source colors.dat

# Request an input from the user for the cluster to be transfering files to 
read -p "Enter Name of Cluster (Cowboy/Pete/Raspy): " clusterName

# if the files are to be transferred to Cowboy
if [ "$clusterName" == "Cowboy" -o "$clusterName" == "C" -o "$clusterName" == "c" ]; then 
	echo "The files will be transferred to Cowboy."
	loc="$Cowboy_UserName@cowboy.hpc.okstate.edu"
	name="Cowboy"
# if the files are to be transferred to Pete
elif [ "$clusterName" == "Pete"  -o "$clusterName" == "P" -o "$clusterName" == "p" ]; then
	echo "The files will be transferred to Pete."
	loc="$Pete_UserName@pete.hpc.okstate.edu"
	name="Pete"
else 
	echo -e "${Red}$clusterName is unavailable, please provide one of the following inputs: c, p, r ${Color_Off}" 
	exit 1
fi

# Reqeust input for the folder the files will be moved into
read -p "Enter file path for $name destination: " path_to_folder
echo "The file(s) will be moved to $path_to_folder on $name"

echo "The location is $loc"

# could loop through the files and folders, but put them all on one line
echo -e "${Green}${files_folders[@]} ${Color_Off}"

# Change one directory down to get into other submodule
cd ..

# scp -r "${files_folders[@]}" $loc:$path_to_folder
