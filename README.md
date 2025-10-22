HWINFO SYSTEM INFO PLUS - Instrucciones de Uso / Usage Instructions

hwinfo-plus.sh es un pequeño script que mejora la visualización de los datos obtenidos con la herramienta de terminal "hwinfo" que puedes instalar en cualquier distribución de linux.

ESPAÑOL
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

