clear
echo ""
echo "*******************************"
echo "Script para automatizar la instalación de diversos programas al reinstalar Ubuntu 20.04"
echo "Desarrollado por Camilo Andres Valencia Acevedo para el curso de Intro. al HPC 2023-1"
echo "Semana 2, Clase 1"
echo "*******************************"
echo ""

echo "Lista de programas:"
echo " - ROS noetic full install"
echo " - VScode"
echo " - Kitty"
echo " - Catkin"
echo " - Git"
echo " - CopyQ"
echo " - Tree"
echo " - Locate"
echo " - Alternativas de Python"
echo " - Modificación aliases Bashrc"
echo " - Xclip"
echo " - Creación llave SSH para Github"

echo "Se requiere privilegios de administrador"
echo " "
sudo echo "Hecho!"

# Modificación de Bashrc
echo "************************* MODIFICACION BASHRC EN CURSO *************************"
echo " ">> ~/.bashrc
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo " ">> ~/.bashrc
echo "# Custom Aliases" >> ~/.bashrc
echo "# BASH" >> ~/.bashrc
echo "alias eb=\"gedit ~/.bashrc\"" >> ~/.bashrc
echo "alias sb=\"source ~/.bashrc\"" >> ~/.bashrc
echo " " >> ~/.bashrc
echo "# System"  >> ~/.bashrc
echo "alias update=\"sudo apt update\"" >> ~/.bashrc
echo "alias shutoff=\"(sleep 5 && shutdown now) &\"" >> ~/.bashrc
echo " " >> ~/.bashrc
echo "# Git" >> ~/.bashrc
echo "alias gitf=\"git fetch origin; git status\"" >> ~/.bashrc
echo " " >> ~/.bashrc
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc
source ~/.bashrc

# Instalación de ROS
echo "************************* INICIANDO INSTALACIÓN DE ROS *************************"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt -y install curl
sudo curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt -y install ros-noetic-desktop-full
sudo apt -y install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt -y install python3-rosdep
sudo rosdep init
sudo rosdep update
rosversion -d
echo "************************* INSTALACIÓN DE ROS FINALIZADA *************************"


# Instalación de VScode
echo "************************* INICIANDO INSTALACIÓN DE VISUAL ESTUDIO *************************"
sudo snap install --classic code
code -v
echo "************************* INSTALACIÓN DE VISUAL ESTUDIO FINALIZADA *************************"


# Instalación de kitty 
echo "************************* INICIANDO INSTALACIÓN DE KITTY *************************"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo apt install kitty -y
kitty --version
echo "************************* INSTALACIÓN DE KITTY FINALIZADA *************************"


# Instalación de Catkin
echo "************************* INICIANDO INSTALACIÓN DE CATKIN *************************"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install python3-catkin-tools
catkin --version
echo "************************* INSTALACIÓN DE CATKIN FINALIZADA *************************"


# Instalación de Git
echo "************************* INICIANDO INSTALACIÓN DE GIT *************************"
sudo apt update
sudo apt -y install git
git --version
echo "************************* INSTALACIÓN DE GIT FINALIZADA *************************"


# Instalación de CopyQ
echo "************************* INICIANDO INSTALACIÓN DE COPYQ *************************"
sudo add-apt-repository --yes ppa:hluk/copyq
sudo apt update
sudo apt -y install copyq
copyq --version
echo "************************* INSTALACIÓN DE COPYQ FINALIZADA *************************"


# Instalación de Tree
echo "************************* INICIANDO INSTALACIÓN DE TREE *************************"
sudo apt -y install tree
tree
echo "************************* INSTALACIÓN DE TREE FINALIZADA *************************"


# Instalación de Locate 
echo "************************* INICIANDO INSTALACIÓN DE LOCATE *************************"
sudo apt -y install locate
locate --version
echo "************************* INSTALACIÓN DE LOCATE FINALIZADA *************************"

# Alternativas de Python
echo "************************* INSTALANDO ALTERNATIVAS PYTHON *************************"
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2


# Instalación Xclip para manejar el clipboard en el terminal
echo "************************* INICIANDO INSTALACIÓN DE XCLIP *************************"
sudo apt -y install xclip
echo "************************* INSTALACIÓN DE XCLIP FINALIZADA *************************"

# Cambio de terminal predeterminado
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

# Llave ssh Github
echo "************************* CREANDO LLAVE SSH GITHUB *************************"
ssh-keygen -f ~/.ssh/id_rsa -t ed25519 -C "cvalenciaa@unal.edu.co" -N ''
cat ~/.ssh/id_rsa.pub | xclip

echo "Llave SSH copiada al portapapeles, no olvides pegarla en https://github.com/settings/keys usando el botón del medio!"
echo "Fin del programa!"