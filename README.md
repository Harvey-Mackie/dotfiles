The dotfiles repo leverages Linux Symbolic linux.

Rather than storing everything in ~/ we can store them in the dotfiles repo then create Symbolic link to create a virtual file

To make the creation and management of Symbolic links easier, [STOW](https://github.com/aspiers/stow) is being used

# Getting started
## Install Stow 
```sh
$ brew install stow
```
## Navigate to the repo after cloning
Execute the below command anytime you add a new file or want to initialise the Symbolic links for the first time.
```sh
$ stow .
```

# Tips
## Brewfile
The brew file is the only file which is not automatically applied or updated. Use the commands below to apply and keep the file updated 
```sh 
# create or update the file
$ brew bundle dump --describe --force 

# apply the file
$ brew bundle --global 
```
