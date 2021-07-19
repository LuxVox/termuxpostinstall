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
	android-tools
)

verificar_updates(){
 pkg update && pkg upgrade
 clear
 echo "Permita o acesso ao armazenamento."
 termux-setup-storage
}

instalar_programas(){
	# Apenas instala os softwares que não estiver instalado.
	for nome_do_programa in ${softwares[@]}; do
    if ! pkg list-installed | grep -q $nome_do_programa; then
    pkg install "$nome_do_programa"
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done
}

instalar_programas_pom(){
	# Programas que serão instalados por outros meios:
	gem install lolcat
	pip install youtube-dl
}


instalar_fontes(){
	# Instala a fonte que estiver no diretório Fonts/
	echo "Instalando fontes..."
	cd Fonts/
	mv font.ttf ~/.termux/font.ttf
	termux-reload-settings
	clear
}

customizacao_do_terminal(){
	# Instala o Zshell e adiciona o Neofetch e Lolcat ao zshrc:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo "Editando o zshrc..."
	cd ~
	echo -e "cd ~/storage/shared\nclear\nneofetch | lolcat\nalias ls=lsd" >> .zshrc
	rm -rf /data/data/com.termux/files/usr/etc/motd # Remove a mensagem inicial.
	exit
}


verificar_updates()
instalar_programas()
instalar_programas_pom()
instalar_fontes()
customizacao_do_terminal()


