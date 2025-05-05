#!/bin/bash

# Set the source and destination directories
NAME=backup_$(date +"%Y%m%d_%H%M%S")
source_directory="$1"
destination_directory="$2"
new_destination_directory="$destination_directory/$NAME"
LOG_FILE="$destination_directory/$NAME.log"

# Set the exclusion list (files or directories to exclude from backup)
exclusion_list=("temp" "cache" "*.log")

# Check if the source directory exists
if [ ! -d "$source_directory" ]; then
    echo "Source directory does not exist. Please check the path." >> "$LOG_FILE" 2>&1
    exit 1
fi

# Create the destination directory if it doesn't exist
if [ ! -d "$destination_directory" ]; then
    mkdir -p "$destination_directory"
fi

LAST_BACKUP=$(find "$destination_directory/" -mindepth 1 -maxdepth 1 -type d | head -n 1)
EXCLUDE_OPTIONS=""
for exclusion in "${exclusion_list[@]}"; do
    EXCLUDE_OPTIONS="$EXCLUDE_OPTIONS --exclude=$exclusion"
done

if [ -n "$LAST_BACKUP" ] && [ -d "$LAST_BACKUP" ]; then
    rsync -av --delete $EXCLUDE_OPTIONS --link-dest="$LAST_BACKUP" "$source_directory" "$new_destination_directory" >> "$LOG_FILE" 2>&1
else
    rsync -av --delete $EXCLUDE_OPTIONS "$source_directory" "$new_destination_directory" >> "$LOG_FILE" 2>&1
fi

# Check the rsync exit status
if [ $? -eq 0 ]; then
    echo "Backup completed successfully. Log file: $LOG_FILE" >> "$LOG_FILE" 2>&1
else
    echo "Backup failed. Check the log file for details: $LOG_FILE" >> "$LOG_FILE" 2>&1
fi
