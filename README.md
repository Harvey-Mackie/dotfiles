The dotfiles repo leverages Linux Symbolic linux.

Rather than storing everything in ~/ we can store them in the dotfiles repo then create Symbolic link to create a virtual file


# Create Links
```
#zshrc
ln -s ~/dotfiles/zshrc/.zshrc ~/.zshrc

#nvim
ln -s ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/dotfiles/nvim/config ~/.config/nvim/config
ln -s ~/dotfiles/nvim/lua ~/.config/nvim/lua
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig

#vim
ln -s .vimrc ~/.vimrc

```

# Undo Links
```
 rm ~/.config/nvim
```
