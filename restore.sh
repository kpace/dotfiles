#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

dir=~/dotfiles/files                    # dotfiles directory
olddir=~/dotfiles_old                   # old dotfiles backup directory

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

cd $dir

# get files from arguments, if supplied
if [ $# -eq 0 ]
  then
	files=`ls $dir`
else
	files=$@
fi

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
	if [ "$file" != "setup.sh" ]; then
		mv ~/.$file ~/dotfiles_old/
		echo "Creating symlink for: $file"
	    ln -s $dir/$file ~/.$file
	fi
done
