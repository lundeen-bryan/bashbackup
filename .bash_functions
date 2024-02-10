alias_help() {
    echo "Twenty-two (22) defined aliases are available:"
    echo ""
    echo "1. lf ................. List files per line."
    echo "2. lfa ................ List files per line, including hidden files."
    echo "3. :q ................. Quit bash using a Vim-like command."
    echo "4. clr ................ Clear the terminal screen."
    echo "5. ipy ................ Run IPython with Vim keybindings."
    echo "6. gh ................. Grep through command history (note: add search"
    echo "                        term in single quotes as a parameter)."
    echo "7. hist ............... Display command history."
    echo "8. listsize ........... List files sorted by size."
    echo "9. listmod ............ List files sorted by modification date."
    echo "10. filecount ......... Count the number of files in the current directory."
    echo "11. ve ................ Create a Python virtual environment."
    echo "12. va ................ Activate the Python virtual environment."
    echo "13. alias_help ........ Show the user all available aliases."
    echo "14. loginMySQL ........ Log in to MySQL."
    echo "15. .. ................ Navigate up one directory level."
    echo "16. gs ................ Show Git status."
    echo "17. :e ................ Open files in Windows Explorer."
    echo "18. docs .............. Shortcut to navigate to the Documents folder."
    echo "19. dl ................ Shortcut to navigate to the Downloads folder."
    echo "20. menv .............. Activate the virtual environment if created in micromamba."
    echo "21. gitfiles2clip ..... Copy all files changed in Git to the clipboard."
    echo "22. hiddenfilecount ... Count only hidden files."
    echo ""
}

menv() {
    env_folder=$(find . -maxdepth 1 -type d -name .venv)
    if [ -n "$env_folder" ]; then
        micromamba activate "$env_folder"
    else
        echo "No .venv folder found in the current directory."
    fi
}

gitfiles2clip() {
    git status --porcelain | awk '{print $2}' | tr '\n' ' ' | $CLIP_CMD
    echo "Files modified in git have been copied to the clipboard."
}

fix_filename() {
    # Check if a file name is provided as an argument
    if [[ $# -eq 0 ]]; then
        echo "Usage: fix_filename <filename>"
        return 1
    fi

    local file="$1"

    # Check if the file exists
    if [[ ! -e $file ]]; then
        echo "Error: File does not exist."
        return 1
    fi

    # Replace '+' and '-' with '_', spaces with '_', and make lowercase, then store the new name
    local new_name=$(echo "$file" | tr '+- ' '_' | tr '[:upper:]' '[:lower:]')

    # Ensure the new name is not empty (which could happen with invalid input or unexpected errors)
    if [[ -z "$new_name" ]]; then
        echo "Error: New filename for '$file' is empty. Skipping."
        return 1
    fi

    # Check if the file and new_name are different to avoid renaming the same file
    if [[ "$file" != "$new_name" ]]; then
        # Check if a file with the new_name already exists to avoid overwriting
        if [[ -e $new_name ]]; then
            echo "Error: '$new_name' already exists. Skipping '$file'."
        else
            # Rename the file
            mv "$file" "$new_name"
            echo "Renamed '$file' to '$new_name'"
        fi
    fi
}


# NOTIFICATIONS #################################

echo "✅ bash_functions loaded"
echo "👀 To see all aliases type alias_help in the terminal."

