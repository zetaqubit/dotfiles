# archlinux setup
Config files managed by GNU Stow.

## i3 window manager
```bash
sudo pacman -S i3-wm
sudo pip install i3-py
stow i3
```

## polybar top bar
[documentation](https://github.com/jaagr/polybar)
```bash
yaourt -S polybar
stow polybar
```

## split ultrawide monitor into 2 displays (for i3)
```bash
stow ultrawide xsession
```

[source](https://askubuntu.com/questions/150066/split-monitor-in-two/998435#998435)


## fix screen tearing
```bash
sudo pacman -S compton
stow compton xsession
```

## font smoothing
```bash
stow fonts
sudo xrdb -merge ~/.Xresources
```

## disable blinking cursor in gnome-terminal
```bash
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')/ cursor-blink-mode off
```

## Logitech trackball scrolling
```bash
stow logitech_trackball
```
If it doesn't immediately work, follow instructions in `~/.config/logitech_trackball.sh`.

## auto-mounting drives under /media
```bash
sudo gnome-disks
sudo chown -R z:z /media/${name}
```


## Jupyter notebook
### Default indent of 2
Paste the following into browser's javascript console.
The setting is persisted. Reset to default by exchanging : 2 for : null.

```javascript
var cell = Jupyter.notebook.get_selected_cell();
var config = cell.config;
var patch = {
  CodeCell:{
    cm_config:{indentUnit:2}
  }
}
config.update(patch)
```

### Full width notebook
Create ~/.jupyter/custom/custom.css with

```
.container { width:100% !important; }
```

[source](https://stackoverflow.com/questions/21971449/how-do-i-increase-the-cell-width-of-the-jupyter-ipython-notebook-in-my-browser)

## Colab notebook
### Set up local Python runtime
[Documentation](https://research.google.com/colaboratory/local-runtimes.html)

### Sync notebooks between git and Google Drive
#### Option 1 (best): ocamlfuse

[Documentation](https://github.com/astrada/google-drive-ocamlfuse)

```bash
yaourt -S google-drive-ocamlfuse
```

```bash
# Authenticate via web browser.
google-drive-ocamlfuse

# Mount Google Drive root at ~/drive.
google-drive-ocamlfuse ~/drive

# Clone source repo into ~/drive
mkdir ~/drive/github; cd ~/drive/github
git clone <source-repo-dir>

# In source repo, configure remotes.
git remote add drive ~/drive/github/<repo-dir>
git branch -u drive/master master

# To sync changes.
git push drive
git pull drive
```

#### Option 2: rclone

[Documentation](https://rclone.org/drive/)

```bash
sudo pacman -S rclone
```

```bash
alias gdrive_push="rclone sync --filter-from ~/code/z/rclone_filter.txt ~/code/z drive_git:z"
alias gdrive_pull="rclone sync --filter-from ~/code/z/rclone_filter.txt drive_git:z  ~/code/z"
alias gdrive_mount="rclone mount drive_git: /mnt/drive_git"
```

## Github
### Preview markdown: [Grip](https://github.com/joeyespo/grip)
```bash
sudo pip install grip
cd myrepo; grip
```
