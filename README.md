# Mac OS

## Battery management
[battery](https://github.com/actuallymentor/battery)
* Limit charging to 80%


# ArchLinux
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

## Fix dual-boot after Windows update
1. Plug in arch-iso (Costco usb)
2. F12 and select USB boot

```bash
loadkeys dvorak
fdisk -l
mkdir /mnt/arch
mount -t auto /dev/nvme0n1p7 /mnt/arch  # Linux filesystem root from fdisk output
arch-chroot /mnt/arch
mount -t auto /dev/nvme0n1p1 /efi  # EFI dir from fdisk output
os-prober
grub-mkconfig > /boot/grub/grub.cfg
grub-install --efi-directory=/efi --target=x86_64-efi /dev/nvme0n1
exit
restart
```
[source](https://www.jeremymorgan.com/blog/linux/how-to-restore-arch-linux-after-installing-windows/)

## Upgrading after a long time
```bash
sudo pacman -Sy archlinux-keyring
sudo pacman -Syyu
```
[source](https://bbs.archlinux.org/viewtopic.php?id=242639)

# Custom configurations

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

### Set up SSH push
Follow instructions [here](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent), then
```bash
cd dotfiles
git remote -v
git remote set-url origin git@github.com:zetaqubit/dotfiles
```
