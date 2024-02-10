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
    if [[ $# -eq 0 ]]; then
        echo "Usage: fix_filename <filename or directory> [recursive true/false]"
        return 1
    fi

    local target="$1"
    local recursive="${2:-false}" # Default to false if not provided

    rename_item() {
        local item="$1"
        # Use sed to replace '+' and '-', spaces with '_', and make lowercase
        local new_name=$(echo "$item" | sed -e 's/[+ -]/_/g' | tr '[:upper:]' '[:lower:]')

        if [[ -z "$new_name" ]]; then
            echo "Error: New name for '$item' is empty. Skipping."
            return 1
        fi

        if [[ "$item" != "$new_name" ]]; then
            if [[ -e $new_name ]]; then
                echo "Error: '$new_name' already exists. Skipping '$item'."
            else
                mv -- "$item" "$new_name"
                echo "Renamed '$item' to '$new_name'"
            fi
        fi
    }

    if [[ -d $target ]]; then
        if [[ $recursive == true ]]; then
            find "$target" -depth ! -path "$target" -print0 | while IFS= read -r -d $'\0' item; do
                dir_path=$(dirname "$item")
                base_name=$(basename "$item")
                pushd "$dir_path" > /dev/null
                rename_item "$base_name"
                popd > /dev/null
            done
        else
            dir_path=$(dirname "$target")
            base_name=$(basename "$target")
            pushd "$dir_path" > /dev/null
            rename_item "$base_name"
            popd > /dev/null
        fi
    elif [[ -e $target ]]; then
        rename_item "$target"
    else
        echo "Error: '$target' does not exist."
        return 1
    fi
}


# NOTIFICATIONS #################################

echo "✅ bash_functions loaded"
echo "👀 To see all aliases type alias_help in the terminal."

