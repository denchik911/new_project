#!/bin/bash
# Set the source and destination directories
NAME=backup_$(date +"%Y%m%d_%H%M%S")
source_directory="$1"
destination_directory="$2"


# Check if the source directory exists
if [ ! -d "$source_directory" ]; then
    echo "Source directory does not exist. Please check the path."
    exit 1
fi

# Create the destination directory if it doesn't exist
if [ ! -d "$destination_directory" ]; then
    mkdir -p "$destination_directory"
fi

new_destination_directory="$destination_directory/$NAME"
# Set a timestamp for the backup to distinguish between different backup versions.
# Create the backup using rsync and ensure that files deleted from the source are also deleted in the backup.
# Use option –-delete
rsync -av --delete "$source_directory" "$new_destination_directory" 
# Check the rsync exit status
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed. Please check the error messages above."
fi
