# HWINFO System Info Plus

![Bash](https://img.shields.io/badge/Bash-4.0%2B-blue)
![License](https://img.shields.io/badge/License-GPL--3.0-green)
![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey)

A modern, visual system information tool for Linux that displays hardware information in a beautiful, condensed format.

**Creator**: David Casas M. - Competencia_Digital  
**AI Assistance**: DEEPSEEK  
**License**: GPL-3.0  
**YouTube**: https://youtube.com/@competencia_digital  
**Website**: https://competenciadigital.name

---

## 📖 Table of Contents / Índice

- [English](#english)
  - [Features](#features)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Screenshots](#screenshots)
  - [Troubleshooting](#troubleshooting)
- [Español](#español)
  - [Características](#características)
  - [Instalación](#instalación)
  - [Uso](#uso)
  - [Capturas de Pantalla](#capturas-de-pantalla)
  - [Solución de Problemas](#solución-de-problemas)

---

## ENGLISH

### Features

- 🎨 **Modern visual interface** with colors and attractive formatting
- 📊 **Condensed information** that fits on one screen
- 📈 **Progress bars** for CPU, memory and temperature
- 🔧 **Wide compatibility** with multiple Linux distributions
- ⚡ **No high requirements** - uses system tools
- 🖥️ **Complete hardware overview** including CPU, motherboard, RAM, storage, and network

### Installation

#### 1. Download and make the script executable:

```bash
# Download the script
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

# For Debian/Ubuntu
sudo apt install pciutils usbutils dmidecode lsblk

# For Fedora/RHEL
sudo dnf install pciutils usbutils dmidecode util-linux

# For Arch Linux
sudo pacman -S pciutils usbutils dmidecode util-linux

# For openSUSE
sudo zypper install pciutils usbutils dmidecode util-linux

Usage
Basic execution:
bash

./hwinfo-plus.sh

Menu Options:

    Full System Information - All hardware components

    Quick System Overview - Essential summarized information

    CPU & Motherboard Detailed - Complete technical specifications

    CPU & Memory Only - Processor and RAM information

    Storage Information - Disks, partitions, and controllers

    Network Information - Interfaces and network controllers

    Motherboard Information - Specific motherboard details

    License Information - GPL-3.0 license details

    Exit - Close the program

Advanced usage - Global installation:
bash

# Create symbolic link for global use
sudo cp hwinfo-plus.sh /usr/local/bin/hwinfo-plus
sudo chmod +x /usr/local/bin/hwinfo-plus

# Now you can run from anywhere
hwinfo-plus

Troubleshooting

If hwinfo is missing:

    The program will work with alternative system tools

    An informative message will be displayed

If there are permission problems:
bash

chmod +x hwinfo-plus.sh

If colors don't appear:
bash

TERM=xterm-256color ./hwinfo-plus.sh

System Requirements:

    Bash 4.0 or higher

    Terminal that supports colors (most modern terminals)

    Basic Linux tools (usually installed by default)

Tested Distributions:

    Ubuntu 20.04+

    Debian 11+

    Fedora 35+

    CentOS 8+

    Arch Linux

    Linux Mint

ESPAÑOL
Características

    🎨 Interfaz visual moderna con colores y formato atractivo

    📊 Información condensada que cabe en una pantalla

    📈 Barras de progreso para CPU, memoria y temperatura

    🔧 Compatibilidad amplia con múltiples distribuciones Linux

    ⚡ Sin requerimientos elevados - usa herramientas del sistema

    🖥️ Visión completa del hardware incluyendo CPU, placa base, RAM, almacenamiento y red

Instalación
1. Descargar y hacer ejecutable el script:
bash

# Descargar el script
wget https://raw.githubusercontent.com/tu-usuario/hwinfo-plus/main/hwinfo-plus.sh

# Dar permisos de ejecución
chmod +x hwinfo-plus.sh

# Ejecutar
./hwinfo-plus.sh

2. Instalar hwinfo (dependiendo de tu distribución):

Debian/Ubuntu/Linux Mint:
bash

sudo apt update
sudo apt install hwinfo

Red Hat/CentOS/Fedora:
bash

# Para Fedora
sudo dnf install hwinfo

# Para CentOS/RHEL
sudo yum install hwinfo

Arch Linux/Manjaro:
bash

sudo pacman -S hwinfo

openSUSE:
bash

sudo zypper install hwinfo

3. Instalar herramientas adicionales recomendadas:
bash

# Para Debian/Ubuntu
sudo apt install pciutils usbutils dmidecode lsblk

# Para Fedora/RHEL
sudo dnf install pciutils usbutils dmidecode util-linux

# Para Arch Linux
sudo pacman -S pciutils usbutils dmidecode util-linux

# Para openSUSE
sudo zypper install pciutils usbutils dmidecode util-linux

Uso
Ejecución básica:
bash

./hwinfo-plus.sh

Opciones del menú:

    Información completa del sistema - Todos los componentes de hardware

    Vista rápida del sistema - Información esencial resumida

    CPU y Placa Base detallado - Especificaciones técnicas completas

    CPU y Memoria - Información del procesador y RAM

    Información de almacenamiento - Discos, particiones y controladores

    Información de red - Interfaces y controladores de red

    Información de la placa base - Detalles específicos de la motherboard

    Información de licencia - Detalles de la licencia GPL-3.0

    Salir - Cerrar el programa

Uso avanzado - Instalación global:
bash

# Hacer enlace simbólico para uso global
sudo cp hwinfo-plus.sh /usr/local/bin/hwinfo-plus
sudo chmod +x /usr/local/bin/hwinfo-plus

# Ahora se puede ejecutar desde cualquier lugar
hwinfo-plus

Solución de Problemas

Si falta hwinfo:

    El programa funcionará con herramientas alternativas del sistema

    Se mostrará un mensaje informativo

Si hay problemas de permisos:
bash

chmod +x hwinfo-plus.sh

Si no se ven colores:
bash

TERM=xterm-256color ./hwinfo-plus.sh

Requisitos del sistema:

    Bash 4.0 o superior

    Terminal que soporte colores (la mayoría de terminales modernos)

    Herramientas básicas de Linux (generalmente instaladas por defecto)

Distribuciones probadas:

    Ubuntu 20.04+

    Debian 11+

    Fedora 35+

    CentOS 8+

    Arch Linux

    Linux Mint

📄 License / Licencia

This project is licensed under the GPL-3.0 License.

Este proyecto está bajo la Licencia GPL-3.0.
🤝 Contributing / Contribuciones

Contributions are welcome! Please feel free to submit a Pull Request.

¡Las contribuciones son bienvenidas! Siéntete libre de enviar un Pull Request.
📧 Contact / Contacto

    YouTube: https://youtube.com/@competencia_digital

    Website: https://competenciadigital.name

    Creator: David Casas M.

⭐ If you find this project useful, please give it a star! / ⭐ Si encuentras útil este proyecto, ¡por favor dale una estrella!

