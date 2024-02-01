#!/bin/bash

echo "Enter the path to the file you want to move:"
read -p "> " file_path

echo "Enter the destination directory (or press ENTER to use the default '/c/Users/blundeen/OneDrive - Department of State Hospitals/Documents'): "
read -p "> " destination_dir

destination_dir="${destination_dir:-'/c/Users/blundeen/OneDrive - Department of State Hospitals/Documents'}"

mv "$file_path" "$destination_dir"

# Check if the move operation was successful
if [ $? -eq 0 ]; then
    echo "File was moved successfully to $destination_dir"
else
    echo "Failed to move the file"
fi

