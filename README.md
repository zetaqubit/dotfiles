# archlinux setup
Config files managed by GNU Stow.

## i3 window manager
```bash
sudo pacman -S i3-wm
sudo pip install i3-py
stow i3
```

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
