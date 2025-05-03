#!/bin/bash

# Set the source and destination directories
source_directory="$1"
destination_directory="$2"

# Set the exclusion list (files or directories to exclude from backup)
exclusion_list=("temp" "cache" "*.log")

# Check if the source directory exists
if [ ! -d "$source_directory" ]; then
    echo "Source directory does not exist. Please check the path."
    exit 1
fi

# Create the destination directory if it doesn't exist
if [ ! -d "$destination_directory" ]; then
    mkdir -p "$destination_directory"
fi

# Set a timestamp for the backup to distinguish between different backup versions.
# Create a log file for the backup with timestamp this file log should capture the output and 
errors generated during the backup process.
# Use rsync for incremental backup with exclusions certain files, and logs the backup process.
# The exclusion_list array contains patterns for files or directories that should be excluded from the backup.
# Use option --exclude

# Write code here...
# ..
# .

# Check the rsync exit status
if [ $? -eq 0 ]; then
    echo "Backup completed successfully. Log file: $log_file"
else
    echo "Backup failed. Check the log file for details: $log_file"
fi