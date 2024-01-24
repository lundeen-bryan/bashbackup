# 1. Inform user that the bash_aliases are loaded
echo "~/.bashbackup/.bash_aliases loaded"

# 2. Ensure that the bash_functions are loaded for reference
# if [ -f ~/.bash_functions ]; then
source ~/.bashbackup/.bash_functions
# fi

# 3. List files per line
alias lf="ls -1ASk"

# 4. List files per line including hidden files
alias lfa="ls -1ASka"

# 5. Quit bash using a Vim-like command
alias :q="exit"

# 6. Clear the terminal screen
alias clr="clear"

# 7. Run IPython with Vim keybindings
alias ipy="ipython --TerminalInteractiveShell.editing_mode='vi'"

# 8. Grep through command history
alias gh="history|grep"

# 9. Display command history
alias hist='history'

# 10. List files sorted by size
alias listsize="ls --human-readable --size -1 -S --classify"

# 11. List files sorted by modification date
alias listmod="ls -t -1"

# 12. Count number of files in the current directory
alias filecount="find . -type f -not -path '*/.*' | wc -l"

# 13. Create a Python virtual environment
alias ve="python3 -m venv .venv"

# 14. Activate the Python virtual environment
alias va="source .venv/Scripts/activate"

# 15. Show user all the aliases available
alias alias_help="alias_help"

# 16. Login to MySQL
alias loginMySQL='MySQL -u root -p'

# 17. Navigate up one directory level
alias ..='cd ..'

# 18. Show Git status
alias gs='git status'

# 19. Open files in Windows Explorer
alias :e="explorer"

# 20. Shortcut to navigate to the Documents folder
alias docs='cd ~/documents/'

# 21. Shortcut to navigate to the Downloads folder
alias dl='cd ~/downloads/'

# 22. Activate the virtual environment if created in micromamba
alias menv="menv"

# 23. Copy all files changed in Git to the clipboard
alias gitfiles2clip="gitfiles2clip"

# 24. Count files that are hidden only
alias hiddenfilecount="find . -type f -name '.*' | wc -l"
