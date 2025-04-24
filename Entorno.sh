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
  echo -e "\033[32m✓\033[0m Sistema operativo basado en debian"
  sleep 1
  sudo $updateD
  echo "Comenzamos con la instalacion de todo lo necesario para un entorno de trabajo basao en BSPWN y POLYBAR para: $(cat /etc/os-release | grep -i '^ID$=' | tr '=' ' ' | awk $'{print $2}')"

  sleep 2
  echo "Nos Ubicaremos en el directorio de Descargas"
  cd $HOME/Descargas/
  sleep 2 
  sudo $installD --noconfirm bspwm polybar sxhkd picom kitty ranger rofi zsh zsh-syntax-highlighting man mlocate xwallpapaer ttf-font-awesome zsh-autosuggestions bat firejail flameshot neotetch caido
  sleep 1
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
  mv .oh-my-zsh $HOME/.
  git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
  mv powerlevel10k $HOME/.powerlevel10k
  sudo mkdir /usr/share/zsh/.pluginszsh
  cd $(find / -type d -name Working-environment 2>/dev/null)
  mv backupEntorno/bin $HOME/.config/.
  mv backupEntorno/bspwm $HOME/.config/.
  mv backupEntorno/kitty $HOME/.config/.
  mv backupEntorno/nvim $HOME/.config/.
  mv backupEntorno/picom $HOME/.config/.
  mv backupEntorno/polybar $HOME/.config/.
  mv backupEntorno/sxhkd $HOME/.config/.
  mv backupEntorno/.pluginszsh/zsh-autosuggestions /usr/share/zsh/.pluginszsh/.
  mv backupEntorno/.pluginszsh/zsh-syntax-highlighting /usr/share/zsh/.pluginszsh/.
  mv backupEntorno/.pluginszsh/sudo.plugins.zsh /usr/share/zsh/.pluginszsh/.
  mv backupEntorno/.zshrc $HOME/.
  mv backupEntorno/.p10k.zsh $HOME/.
  mv backupEntorno/nord.rasi /usr/share/rofi/themes/.
  sudo usermod -s $(which zsh) $(whoami)
  sleep 3
  echo -e "\033[32m✓\033[0m Todo esta perfectamente INSTALADO es hora de resetear a la pantalla de inicio elegir BSPWM y a disfritar del entorno"
  sleep 3
  kill -9 -1

else cat /etc/os-release | grep -q "ID=archlinux";
  echo -e "\033[32m✓\033[0m Sistema operativo basado en archlinux"
  sleep 1
  sudo $updateA

  sleep 2
  echo "Comenzamos con la instalacion de todo lo necesario para un entorno de trabajo basao en BSPWN y POLYBAR para: $(cat /etc/os-release | grep -i '^ID$=' | tr '=' ' ' | awk $'{print $2}')"
  sleep 2
  echo "Nos Ubicaremos en el directorio de Descargas"
  cd $HOME/Descargas/
  sleep 2 
  sudo $installA --noconfirm bspwm polybar sxhkd picom kitty ranger rofi zsh zsh-syntax-highlighting man mlocate xwallpapaer ttf-font-awesome zsh-autosuggestions bat firejail flameshot neotetch caido
  sleep 1
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
  mv .oh-my-zsh $HOME/.
  git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
  mv powerlevel10k $HOME/.powerlevel10k
  sudo mkdir /usr/share/zsh/.pluginszsh
  cd $(find / -type d -name Working-environment 2>/dev/null)
  mv backupEntorno/bin $HOME/.config/.
  mv backupEntorno/bspwm $HOME/.config/.
  mv backupEntorno/kitty $HOME/.config/.
  mv backupEntorno/nvim $HOME/.config/.
  mv backupEntorno/picom $HOME/.config/.
  mv backupEntorno/polybar $HOME/.config/.
  mv backupEntorno/sxhkd $HOME/.config/.
  mv backupEntorno/.pluginszsh/zsh-autosuggestions /usr/share/zsh/.pluginszsh/.
  mv backupEntorno/.pluginszsh/zsh-syntax-highlighting /usr/share/zsh/.pluginszsh/.
  mv backupEntorno/.pluginszsh/sudo.plugins.zsh /usr/share/zsh/.pluginszsh/.
  mv backupEntorno/.zshrc $HOME/.
  mv backupEntorno/.p10k.zsh $HOME/.
  mv backupEntorno/nord.rasi /usr/share/rofi/themes/.
  sudo usermod -s $(which zsh) $(whoami)
  sleep 3
  echo -e "\033[32m✓\033[0m Todo esta perfectamente INSTALADO es hora de resetear a la pantalla de inicio elegir BSPWM y a disfritar del entorno"
  sleep 3
  kill -9 -1
fi

