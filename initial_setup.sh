cd
sudo ln -s ~/anarchy4ever/pacman.conf /etc/pacman.conf 
sudo pacman-key -r 0EE7A126
sudo pacman-key --lsign-key 0EE7A126
sudo pacman -Syy
sudo pacman -S --needed redshift gparted vim zsh grml-zsh-config firefox unzip wget shotwell gimp libreoffice evince gnome-screenshot thunderbird transmission evince clementine vlc projectm file-roller jshon python-virtualenvwrapper unrar zip p7zip mlocate wxgtk ntp
wget https://aur.archlinux.org/packages/pa/packer/packer.tar.gz
tar -xzvf packer.tar.gz
cd ./packer
makepkg
sudo pacman -U packer*
cd
sudo rm -r packer*
packer -S ttf-ms-fonts brewtarget archey3
sudo pacman -S netflix-desktop
chsh -s /bin/zsh
ln -s ~/anarchy4ever/.vimrc ~/.vimrc
ln -s ~/anarchy4ever/.vimrc-combined ~/.vimrc-combined
ln -s ~/anarchy4ever/zshrc ~/.zshrc
ln -s ~/anarchy4ever/.zshrc.local ~/.zshrc.local
ln -s ~/anarchy4ever/fonts ~/.fonts
sudo ln -s ~/anarchy4ever/metacity-theme-3.xml /usr/share/themes/Adwaita/metacity-1/metacity-theme-3.xml 
ln -s ~/anarchy4ever/.vimperatorrc ~/.vimperatorrc
ln -s ~/anarchy4ever/redshift.conf ~/.config/redshift.conf
sudo updatedb
sudo systemctl start ntpd
sudo systemctl enable ntpd
