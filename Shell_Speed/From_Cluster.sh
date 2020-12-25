
# Jack C. Cook
# Friday, December 25, 2020

# Shell script for logging into cluster or raspberry pi

# Source the configuration file
source configuration.dat

# Source (load) colors for text
# For information on coloring text: https://stackoverflow.com/a/28938235/11637415
source colors.dat

# Request an input from the user for the cluster to be transfering files to
read -p "Enter Name of Cluster (Cowboy/Pete/Raspy): " clusterName

# if the files are to be transferred to Cowboy
if [ "$clusterName" == "Cowboy" -o "$clusterName" == "C" -o "$clusterName" == "c" ]; then
	loc="$Cowboy_UserName@cowboy.hpc.okstate.edu"
	name="Cowboy"
# if the files are to be transferred to Pete
elif [ "$clusterName" == "Pete"  -o "$clusterName" == "P" -o "$clusterName" == "p" ]; then
	loc="$Pete_UserName@pete.hpc.okstate.edu"
	name="Pete"
else
	echo -e "${Red}$clusterName is unavailable, please provide one of the following inputs: c, p, r ${Color_Off}" 
	exit 1
fi

# Request input of the location on the cluster
read -p "Enter path of location on cluster to be transferred from: " files_folders


# Tell the person what is going on
echo -e "Files will be transferred from ${Green}${name}${Color_Off}:$files_folders and will be transferred to the local directory."

scp -r $loc:$files_folders .
