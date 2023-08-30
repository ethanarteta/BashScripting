#1/bin/bash
# Automated Server Update Script
# This script was made to update the server automaticaly at Friday at 11 pm 
# and to provide a .txt file that records the output of the update process 
# and then it counts the number of each upgradeable package.

# This performs the server update and makes a variable containing the list.
sudo apt update
update_output=$(sudo apt list --upgradeable)

# This creates a variable that collects and searches for the number of 
# upgradeable packages. 
upgradeable_count=$(echo "$update_output" | grep -cF '[upgradeable form:')

# This creates varibale that contains the current date and then creates a 
# a file that incorporates the date into the .txt  
current_date=$(date +%m.%d.%y)
output_file="update$current_date.txt"

# This grabs all the variables and inserts all the correct information needed into 
# the .txt file
echo "Update Output:" > "$output_file"
echo "$update_output" >> "$output_file"
echo "Number of Upgradeable Packages: $upgradeable_count" >> "$output_file"

# Instructions

# Once you Create the script file we need to make the script executable
# We will use the script below to do so:
# "chmod +x update.sh" 

# Next we are going to add this script to Cron Job which will enable us to 
# schedule this script 


