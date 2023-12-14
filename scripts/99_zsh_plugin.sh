#!/bin/bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting  
echo -e "\n--- Para habilitar plugins siga estos pasos --"
echo -e "1) modifique el archivo ~/.zshrc"
echo -e "2) agregue los plugins en la seccion 'plugins'"
echo -e "3) refresque la terminal\n"
echo -e "sudo nano ~/.zshrc"
echo -e "plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker)"
echo -e "source ~/.zshrc"
echo -e "\n--- Para cambiar la terminal a un usuario ejecute:\n"
echo -e "chsh -s $(which zsh)"
