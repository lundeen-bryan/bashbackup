# Check if we are running interactive mode or not
# 1. Interactive mode check
case $- in
    *i*)
	echo "🔔 This is an interactive shell."
	;;
      *)
	echo "🔕 This is a non-interactive shell."
	return
	;;
esac

# 2. Vim Keybindings
# This command enables Vim-style keybindings in the bash shell.
# It allows you to use Vim's command mode for editing commands in the terminal.
set -o vi

# 3. Custom Key Binding
# This binds the "jk" key sequence to exit insert mode and enter normal mode in the shell.
# It's a shortcut for Vim users to quickly switch modes in the bash shell.
bind '"jk":vi-movement-mode'

# 4. Alias Loading
# This section checks if a .bash_aliases file exists and sources it to load aliases.
# If the file is not found, it outputs a warning message.
# This keeps aliases separate and organized in a different file.
# Put all aliases into a separate file
if [ -f ~/.bashbackup/.bash_aliases ]; then
    . ~/.bashbackup/.bash_aliases
else
	echo "⛔ Warning: Unable to load .bash_aliases from ~/.bashbackup/"
fi

# bash_functions loaded
if [ -f ~/.bashbackup/.bash_functions ]; then
    . ~/.bashbackup/.bash_functions
else
	echo "⛔ Warning: Unable to load .bash_aliases from ~/.bashbackup/"
fi

# 5. History Control
# This sets the 'ignoreboth' option for the command history.
# 'ignoreboth' is shorthand for 'ignorespace' and 'ignoredups',
# preventing commands that start with a space and duplicate commands from being saved in history.
HISTCONTROL=ignoreboth

# 6. History Append
# This option ensures that bash appends to the history file, rather than overwriting it.
# It preserves the command history across different sessions.
shopt -s histappend

# 7. History Size Configuration
# Sets the maximum number of commands to save in the command history (HISTSIZE).
# Also sets the maximum size of the history file (HISTFILESIZE).
HISTSIZE=1000
HISTFILESIZE=2000

# 8. Terminal Colors for Linux
# This section sets custom colors for the terminal when using the 'linux' terminal type.
# It defines colors for different elements like text and background, improving readability and aesthetics.
# Comment out/in depending on if you want to use a theme/scheme
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi

# 9. Custom Terminal Prompt
# Various options for customizing the bash prompt (PS1).
# Includes settings for window title, newline, colors, and the format of the prompt.
# Users can uncomment the preferred configuration.
# 9. Set the terminal prompt. Comment out any prompt you don't want to use.
# PS1='\[\033]0;New Git Bash Title:$PWD\007\]' # change Git Bash window title
# PS1="$PS1"'\n'           # new line
# PS1="$PS1"'\[\033[32m\]' # change Git Bash prompt color to green
# PS1="$PS1"'lundeen-bryan > ' # Change Git Bash shere user@host<space> setting
# PS1="$PS1"'\[\033[35m\]' # change Git Bash shell color to purple
# PS1="$PS1"'Not Ming32 '  # change Git Bash shell MING64 display
# PS1="$PS1"'\[\033[33m\]' # change Git Bash Prompt color to brownish yellow
# PS1="$PS1"'\w' # Display Git Bash prompt'scurrent working directory
# PS1='\[\033[32m\]''Location: \w\n> ' # Display Git Bash with just directory path and > symbol

# 10. Path Extension for VS Code
# Adds Visual Studio Code's binary location to the system PATH.
# This allows VS Code to be launched from the terminal using the 'code' command.
export PATH=$PATH:C:\Users\lunde\AppData\Local\Programs\Microsoft VS Code\bin

# 11. Additional Color Codes
# Defines a set of color variables for use in customizing the terminal.
# These colors can be used in prompts, echoing messages, etc.
# Currently commented out, but can be enabled as needed.
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset
#
## Prompt colours
atC="${txtcyn}"
nameC="${txtcyn}"
hostC="${txtcyn}"
pathC="${txtgrn}"
gitC="${txtcyn}"
pointerC="${txtgrn}"
normalC="${txtwht}"

# 12. Root User Prompt Color
# Changes the color of the prompt when logged in as the root user.
# This is a safety feature to make it clear when operating with root privileges.
# The prompt color is set to red for high visibility.
if [ "${UID}" -eq "0" ]; then
 nameC="${txtred}"
fi
#

# Ensure we can use Windows clipboard in bash
if grep -q Microsoft /proc/version; then
    # Environment is WSL
    export CLIP_CMD="/mnt/c/Windows/System32/clip.exe"
else
    # For other systems, adjust as necessary
    export CLIP_CMD="/c/Windows/System32/clip.exe"  # assuming 'clip' is available in the PATH
fi

# 14. Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# 15. Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# 16. Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# 17. Set variables identifying the terminal environment
#     (used in the prompt)
check_and_set_color_prompt() {
    case "$TERM" in
        xterm-color|*-256color)
            force_color_prompt=yes
            echo "💓 Your terminal supports color. Color prompt enabled."
            ;;
        *)
            echo "💔 Your terminal does not support color. Default prompt used."
            ;;
    esac
}

# 18. Set the terminal color prompt
# 🕮 <lunde> 31628a47-2029-40d7-bd56-3d954b8f6d7c.md
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
	PS1="${nameC}\u${atC}@${hostC}\h:${pathC}\w${pointerC}\n▶${normalC} "
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    # PS1="${pathC}\w ${gitC}\$(gitBranch) ${pointerC}\$${normalC} "
	PS1="${nameC}\u${atC}@${hostC}\h:${pathC}\w${pointerC}\n▶${normalC} "
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Notification
# This line outputs a message to the terminal when the .bashrc file is loaded.
# It is useful for confirming that the .bashrc file is being sourced correctly.
echo "✅ bashrc is loaded"

# FUNCTION CALLS BELOW THIS LINE

# check if terminal supports color
check_and_set_color_prompt
