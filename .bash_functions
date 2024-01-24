echo "~/.bashbackup/.bash_functions loaded"
echo "To see all aliases type alias_help in the terminal."

alias_help() {
    echo ""
    echo "Twenty-two (22) defined aliases:"
    echo ""
		echo "1. List files per line = lf"
		echo "2. List files per line including hidden files = lfa"
		echo "3. Quit bash using a Vim-like command = :q"
		echo "4. Clear the terminal screen = clr"
		echo "5. Run IPython with Vim keybindings = ipy"
		echo "6. Grep through command history (note add search term in single quotes as parameter) = gh"
		echo "7. Display command history = hist"
		echo "8. List files sorted by size = listsize"
		echo "9. List files sorted by modification date = listmod"
		echo "10. Count number of files in the current directory = filecount"
		echo "11. Create a Python virtual environment = ve"
		echo "12. Activate the Python virtual environment = va"
		echo "13. Show user all the aliases available = alias_help"
		echo "14. Login to MySQL = loginMySQL"
		echo "15. Navigate up one directory level = .."
		echo "16. Show Git status = gs"
		echo "17. Open files in Windows Explorer = :e"
		echo "18. Shortcut to navigate to the Documents folder = docs"
		echo "19. Shortcut to navigate to the Downloads folder = dl"
		echo "20. Activate the virtual environment if created in micromamba = menv"
		echo "21. Copy all files changed in Git to the clipboard = gitfiles2clip"
		echo "22. Count only hidden files = hiddenfilecount"
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
