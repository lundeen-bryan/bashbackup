# list files per line
alias lf="ls -1ASk"
# list files per line include "." files
alias lfa="ls -1ASka"
# quit bash like in vim
alias :q="exit"
# clear the screen
alias clr="clear"
# run ipython with vi
alias ipy="ipython --TerminalInteractiveShell.editing_mode='vi'"
# show grep history
alias gh="history|grep"
# show enter history
alias hist='history'
# list files by size
alias listsize="ls --human-readable --size -1 -S --classify"
# list files by mod date
alias listmod="ls -t -1"
# show file count
alias filecount="find . -type f | wc -l"
# create python virtual environment
alias ve="python3 -m venv .venv"
alias va="source ./venv/Scripts/activate"
# Navigate up one level
alias ..='cd ..'
# Show Git status
alias gs='git status'
# Navigate to the downloads folder
alias myal='cat ~/.bashbackup/.bash_aliases'
gitfiles2clip() {
    git status --porcelain | awk '{print $2}' | tr '\n' ' ' | clip
    echo "Files modified in git have been copied to the clipboard."
}
# shortcut to start explorer to open
# a file in a the native windows app
alias :e="explorer"
# shortcut to documents folder
alias docs="/c/Users/lunde/documents/"
# shortcut to downloads folder
alias dl="/c/Users/lunde/downloads"



