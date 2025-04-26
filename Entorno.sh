#!/bin/bash

# Variables
updateD='sudo apt update'
updateA='pacman -Syu'
installD='sudo apt install'
installA='pacman -S'

# Comprobar si se ejecuta como root
#if [ "$(id -u)" != "0" ]; then
#  echo -e "\033[33m\u26A0\033[0m Error: Este script requiere privilegios de root"
#  echo -e "\033[33m\u26A0\033[0m Por favor, ejecute con sudo"
#    exit 1
#fi

# Comprobacion de SO
if cat /etc/os-release | grep -q '^ID=debian'; then
  echo -e "\033[32m✓\033[0m Sistema operativo basado en $(cat /etc/os-release | grep -i '^ID=' | tr '=' ' ' | awk $'{print $2}')"
  sleep 1
  sudo $updateD
  echo "Comenzamos con la instalacion de todo lo necesario para un entorno de trabajo basao en BSPWN y POLYBAR para: $(cat /etc/os-release | grep -i '^ID=' | tr '=' ' ' | awk $'{print $2}')"

  sleep 2
  echo "Nos Ubicaremos en el directorio de Descargas"
  cd $HOME/Descargas/
  sleep 2 
  sudo $installD --noconfirm bspwm polybar sxhkd picom kitty ranger rofi zsh zsh-autosuggestions zsh-syntax-highlighting man-db mlocate ttf-font-awesome bat lsd firejail flameshot feh neotetch caido
  sleep 1
  wget https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip
  sudo mv CascadiaCode-2407.24.zip /usr/share/fonts/ttf/.
  sudo 7z x /usr/share/fonts/ttf/CascadiaCode-2407.24.zip
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip
  sudo mv Hack.zip /usr/share/fonts/ttf/.
  sudo 7z x /usr/share/fonts/ttf/Hack.zip
  fc-cache -v
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
  git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/.powerlevel10k
  sudo mkdir /usr/share/zsh/.pluginszsh
  cd $(find / -type d -name Working-environment 2>/dev/null)
  cp -r backupEntorno/bin $HOME/.config/.
  cp -r backupEntorno/bspwm $HOME/.config/.
  cp-r backupEntorno/kitty $HOME/.config/.
  cp -r backupEntorno/nvim $HOME/.config/.
  cp -r backupEntorno/picom $HOME/.config/.
  cp -r backupEntorno/polybar $HOME/.config/.
  cp -r backupEntorno/sxhkd $HOME/.config/.
  sudo cp backupEntorno/.pluginszsh/sudo.plugins.zsh /usr/share/zsh/.pluginszsh/.
  cp backupEntorno/.zshrc $HOME/.
  cp backupEntorno/.p10k.zsh $HOME/.
  sudo cp backupEntorno/nord.rasi /usr/share/rofi/themes/.
  sudo usermod -s $(which zsh) $(whoami)
  git clone --depth 1 https://github.com/junegunn/fzf.git
~/.fzf/install
sudo git clone --depth 1 https://github.com/junegunn/fzf.git 
  sudo mv fzf /root/.fzf
  sudo /root/.fzf/install
  sleep 3
  cd 
  rm -rf ~/Descargas/Working-environment
  echo -e "\033[32m✓\033[0m Todo esta perfectamente INSTALADO es hora de resetear a la pantalla de inicio elegir BSPWM y a disfritar del entorno"
  sleep 3
  kill -9 -1


else cat /etc/os-release | grep -q "ID=archlinux";
  echo -e "\033[32m✓\033[0m Sistema operativo basado en $(cat /etc/os-release | grep -i '^ID=' | tr '=' ' ' | awk $'{print $2}')"
  sleep 1
  sudo $updateA

  sleep 2
  echo "Comenzamos con la instalacion de todo lo necesario para un entorno de trabajo basao en BSPWN y POLYBAR para: $(cat /etc/os-release | grep -i '^ID=' | tr '=' ' ' | awk $'{print $2}')"
  sleep 2
  echo "Nos Ubicaremos en el directorio de Descargas"
  cd $HOME/Descargas/
  sleep 2 
  sudo $installA --noconfirm bspwm polybar sxhkd picom kitty ranger rofi zsh zsh-syntax-highlighting zsh-autosuggestions man-db mlocate firefox  zsh-autosuggestions bat firejail flameshot neofetch feh nvim 7zip xorg-xrandr caja xorg-xinput lsd ttf-font-awesome
  sleep 1
  git clone https://github.com/VaughnValle/blue-sky.git
  sudo cp blue-sky/polybar/fonts/* /usr/share/fonts/truetype/.
  rm -rf blue-sky
  wget https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip
  sudo mv CascadiaCode-2407.24.zip /usr/share/fonts/.
  sudo 7z x /usr/share/fonts/CascadiaCode-2407.24.zip
  sleep 1
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip
  sudo mv Hack.zip /usr/share/fonts/.
  sudo 7z x /usr/share/fonts/Hack.zip
  fc-cache -v
  git clone https://github.com/4akatun/Working-environment.git
  git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
  sleep 5
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
  git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/.powerlevel10k
  sudo mkdir /usr/share/zsh/.pluginszsh
  sleep 1 
  wget https://blackarch.org/strap.sh
  chmod +x strap.sh
  sudo ./strap.sh
  sleep 1
  cd $(find / -type d -name Working-environment 2>/dev/null)
  mkdir ~/wallpaper/
  cp Entorno-img/1345403.jpeg ~/wallpaper/.
  cp -r backupEntorno/bin $HOME/.config/.
  cp -r backupEntorno/bspwm $HOME/.config/.
  cp -r backupEntorno/kitty $HOME/.config/.
  cp -r backupEntorno/picom $HOME/.config/.
  cp -r backupEntorno/polybar $HOME/.config/.
  cp -r backupEntorno/sxhkd $HOME/.config/.
  sudo cp -r backupEntorno/.pluginszsh/sudo.plugin.zsh /usr/share/zsh/.pluginszsh/.
  cp  backupEntorno/.zshrc $HOME/.
  cp  backupEntorno/.p10k.zsh $HOME/.
  sleep 2
  sudo cp backupEntorno/nord.rasi /usr/share/rofi/themes/.
  
  sudo usermod -s $(which zsh) $(whoami)
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
  sudo git clone --depth 1 https://github.com/junegunn/fzf.git 
  sudo mv fzf /root/.fzf
  sudo /root/.fzf/install
  sleep 2
  cd 
  rm -rf ~/Descargas/Working-environment
  echo -e "\033[32m✓\033[0m Todo esta perfectamente INSTALADO es hora de resetear a la pantalla de inicio elegir BSPWM y a disfritar del entorno"
  sleep 3
  kill -9 -1
fi

