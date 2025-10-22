HWINFO SYSTEM INFO PLUS - Instrucciones de Uso / Usage Instructions

hwinfo-plus.sh es un pequeño script que mejora la visualización de los datos obtenidos con la herramienta de terminal "hwinfo" que puedes instalar en cualquier distribución de linux.

ESPAÑOL (english version scroll down)
Instalación
1. Descargar y hacer ejecutable el script:

  # Descargar el script (si no lo tienes)
  wget https://raw.githubusercontent.com/tu-usuario/hwinfo-plus/main/hwinfo-plus.sh

  # Dar permisos de ejecución
  chmod +x hwinfo-plus.sh

  # Ejecutar
  ./hwinfo-plus.sh 

2. Instalar hwinfo (dependiendo de tu distribución):

  Debian/Ubuntu/Linux Mint:

  sudo apt update
  sudo apt install hwinfo

  Red Hat/CentOS/Fedora:

  # Para Fedora
  sudo dnf install hwinfo

  # Para CentOS/RHEL
  sudo yum install hwinfo

  Arch Linux/Manjaro

  sudo pacman -S hwinfo

  openSUSE

  sudo zypper install hwinfo


3. Instalar herramientas adicionales recomendadas:

  # Para todas las distribuciones (herramientas básicas)
  sudo apt install pciutils usbutils dmidecode lsblk  # Debian/Ubuntu
  sudo dnf install pciutils usbutils dmidecode util-linux  # Fedora

Uso del Programa
Ejecución básica:

  ./hwinfo-plus.sh


Si quieres ejecutar el programa desde cualquier ubicación, puedes copiarlo a la carpeta de binarios de usuario:

# Hacer enlace simbólico para uso global
sudo cp hwinfo-plus.sh /usr/local/bin/hwinfo-plus
sudo chmod +x /usr/local/bin/hwinfo-plus
hwinfo-plus  # Ahora se puede ejecutar desde cualquier lugar

Características Principales

    Interfaz visual moderna con colores y formato atractivo
    Información condensada que cabe en una pantalla
    Barras de progreso para CPU, memoria y temperatura
    Compatibilidad amplia con múltiples distribuciones Linux
    Sin requerimientos elevados - usa herramientas del sistema

Solución de Problemas

Si falta hwinfo:

    El programa funcionará con herramientas alternativas
    Se mostrará un mensaje informativo

ENGLISH

Installation

1. Download and make the script executable:
bash

# Download the script (if you don't have it)
wget https://raw.githubusercontent.com/your-username/hwinfo-plus/main/hwinfo-plus.sh

# Give execution permissions
chmod +x hwinfo-plus.sh

# Execute
./hwinfo-plus.sh

2. Install hwinfo (depending on your distribution):

Debian/Ubuntu/Linux Mint:
bash

sudo apt update
sudo apt install hwinfo

Red Hat/CentOS/Fedora:
bash

# For Fedora
sudo dnf install hwinfo

# For CentOS/RHEL
sudo yum install hwinfo

Arch Linux/Manjaro:
bash

sudo pacman -S hwinfo

openSUSE:
bash

sudo zypper install hwinfo

3. Install recommended additional tools:
bash

# For all distributions (basic tools)
sudo apt install pciutils usbutils dmidecode lsblk  # Debian/Ubuntu
sudo dnf install pciutils usbutils dmidecode util-linux  # Fedora

Program Usage

Basic execution:
bash

./hwinfo-plus.sh

If you want to run the program from any location, you can copy it to the user binaries folder:
bash

# Create symbolic link for global use
sudo cp hwinfo-plus.sh /usr/local/bin/hwinfo-plus
sudo chmod +x /usr/local/bin/hwinfo-plus
hwinfo-plus  # Now it can be executed from anywhere

Key Features

    Modern visual interface with colors and attractive formatting
    Condensed information that fits on one screen
    Progress bars for CPU, memory and temperature
    Wide compatibility with multiple Linux distributions
    No high requirements - uses system tools

Troubleshooting

If hwinfo is missing:

    The program will work with alternative tools
    An informative message will be displayed
