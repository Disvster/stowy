# stowy - directory to save and `stow` my dotfiles

In this repo is where I add, edit and `stow` the config files for the packages that I use in my worspace.

## Using the GNU's Stow command

### Why it's cool

`stow` is a command that creates and manages symlinks.

With it I can not only store all my dotfiles in a single git repository, but also edit themfrom said repo and all the changes will be applied to my system.
How? Because I give stow the path to where a file should be, and when i call `stow` it creates a symlink of this dotfile where it should be placed. e.g.:
 ``` 
$>ls -la ~/.config | grep nvim 
lrwxrwxrwx  [...] nvim -> ../stowy/neovim/.config/nvim
```
In this example, whenever I edit/add/remove any file under `~/stowy/neovim/.config/nvim` (or it's symlink under `~/.config/nvim/`) the changes will always affect the symlink (or vice versa).

Refer to ['this website'](https://www.gnu.org/software/stow/) if you have doubts.

### Install

I installed using `yay -S stow` because I'm using manjaro atm.
Use wtv package manager you usually use or clone the ['official repo'](https://git.savannah.gnu.org/git/stow.git).

### Using `stow`

* Create a git repo, clone it, and `cd` into it. Mine is in `~/stowy/` (call it wtv u want).
* Create directories with the names of the packages you want to stow and their specific paths to their config files. I'll use neovim again as an example:
`mkdir -p neovim/.config/nvim`
* Move the original config files (if there are any) to the new directory you created:
`mv ~/.config/nvim/* ~/stowy/neovim/.config/nvim/.`
* use `stow neovim` so that the directory `~/stowy/neovim/.config/nvim` now has a symlink to it under `~/.config/`

You can do this to any type of file in any directory, just make sure you give the correct path to the file you want to create a symlink for, under the directory with the package's name.

You can also watch [this youtube video](https://www.youtube.com/watch?v=NoFiYOqnC4o) if you prefer a more visual guide.
