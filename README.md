# BashScripting
Bash script:  Automated server update
# Automated Server Update Script Instructions

Follow these steps to set up and schedule the automated server update script:

1. **Create the Script File:** Create a new file named `update.sh` and paste the script content below into it.

    ```bash
    #!/bin/bash
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
    echo "Number of Upgradeable Packages: $upgradeable_count" >> "$output_file"#!/bin/bash

    ```

2. **Make the Script Executable:** Make the script executable using the following command:

    ```bash
    chmod +x server_update_script.sh
    ```

3. **Add a Cron Job:** Add a `cron` job to schedule the script to run every Friday at 11 pm by editing the `cron` table:

    ```bash
    crontab -e
    ```

4. **Schedule the Script:** Add the following line to the `cron` table to schedule the script:

    ```bash
    0 23 * * 5 /ubuntu/home/update.sh
    ```

5. **Save and Exit:** Save the file and exit the editor. The script will now be scheduled to run every Friday at 11 pm, updating the server and saving the information to a file.

