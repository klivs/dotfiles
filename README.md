# klivs's dotfiles

This repo was created for handling dotfiles as described in [this post](https://news.ycombinator.com/item?id=11071754).

A complete guide using the technique described can be found [here](https://www.atlassian.com/git/tutorials/dotfiles).

## Installing dotfiles onto a new system (or migrate to this setup)

### Basic configuration
Run the following commands:
```bash
git clone --bare https://bitbucket.org/klivs/dotfiles.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
### Add new configuration files to repo

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .config/redshift.conf
config commit -m "Add redshift config"
config push
```
