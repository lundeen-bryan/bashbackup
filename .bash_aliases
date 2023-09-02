
# list files per line
alias list="ls -1ASk"
# quit bash like in vim
alias :q="exit"
# clear the screen
alias clr="clear"
# shortcut to documents folder
docs="/c/Users/lunde/documents/"
# shortcut to downloads folder
dl="/c/Users/lunde/downloads/"
# function to clip git status output to clipboard
gitfiles2clip() {
    git status --porcelain | awk '{print $2}' | tr '\n' ' ' | clip
    echo "Files modified in git have been copied to the clipboard."
}

