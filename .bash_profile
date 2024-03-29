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
    source /mnt/c/Users/lunde/bashbackup/.bashrc
fi

export MAMBA_EXE='/c/Users/lunde/.micromamba/Library/bin/micromamba';
export MAMBA_ROOT_PREFIX='/c/Users/lunde/.micromamba';
eval "$("$MAMBA_EXE" shell hook --shell bash --prefix "$MAMBA_ROOT_PREFIX")"

echo "✅ bash_profile is loaded."