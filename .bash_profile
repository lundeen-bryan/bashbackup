echo "~/.bashbackup/.bash_profile is loaded."

# generated by Git for Windows
#test -f ~/.profile && . ~/.profile
# test to see if the bashrc exists
#test -f ~/.bashbackup/.bashrc && . ~/.bashbackup/.bashrc

# code below does the same as test above
if
    [ -f ~/.bashbackup/.bashrc ];
then
    source ~/.bashbackup/.bashrc
else
    source ~/.bashrc
fi

