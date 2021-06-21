# Array com o nome dos softwares que serão instalados abaixo.
softwares=(
	x11-repo
	unstable-repo
	ruby
	python
	python2
	nodejs
	git
	wget
	curl
	nano
	vim
	golang
	yarn
	php
	fakeroot
	make
	dpkg
	p7zip
	p7zip-plugins
	unrar
	tar
	rsync
	neofetch
	man
	cmus
	irssi
	lsd
	w3m
	zsh
	ranger
	cmatrix
	lynx
	rtorrent
)


# Verificar updates e instala os softwares.
pkg update && pkg upgrade
clear
echo "Permita o acesso ao armazenamento."
termux-setup-storage

for nome_do_programa in ${softwares[@]}; do
    if ! pkg list-installed | grep -q $nome_do_programa; then # Apenas instala o software que não estiver instalado.
    pkg install "$nome_do_programa"
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

# Programas que serão instalados por outros meios:
gem install lolcat


echo "Instalando fontes..."
cd Fonts/
mv font.ttf ~/.termux/font.ttf
termux-reload-settings
clear

# Adiciona neofetch e lolcat ao zshrc:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Editando o zshrc..."
cd
echo -e "cd ~/storage/shared\nclear\nneofetch | lolcat\nalias ls=lsd" >> .zshrc
rm -rf /data/data/com.termux/files/usr/etc/motd # Remove a mensagem inicial.
exit





