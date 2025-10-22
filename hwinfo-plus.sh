#!/bin/bash
###############################################################################
#                                                                             #
#                          HWINFO SYSTEM INFO PLUS                            #
#                                                                             #
# Creator: David Casas M. - Competencia_Digital                               #
# Created with AI assistance: DEEPSEEK                                        #
# License: GPL-3.0                                                            #
# YouTube: https://youtube.com/@competencia_digital                           #
# Website: https://competenciadigital.name                                    #
#                                                                             #
# Description: Modern, visual system information tool for Linux               #
# Displays hardware information in a beautiful, condensed format              #
#                                                                             #
###############################################################################

# Colores para la interfaz
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Función para mostrar header
show_header() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                   HWINFO - SYSTEM INFO PLUS                  ║"
    echo "║                    Modern System Scanner                     ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${YELLOW}Creator: David Casas M. - Competencia_Digital${NC}"
    echo -e "${BLUE}YouTube: https://youtube.com/@competencia_digital${NC}"
    echo -e "${GREEN}Website: https://competenciadigital.name${NC}"
    echo -e "${PURPLE}License: GPL-3.0 | Created with AI assistance${NC}"
    echo ""
}

# Función para mostrar información de licencia
show_license() {
    section "LICENSE INFORMATION"
    echo -e "${WHITE}This program is free software: you can redistribute it and/or modify"
    echo -e "it under the terms of the GNU General Public License as published by"
    echo -e "the Free Software Foundation, either version 3 of the License, or"
    echo -e "(at your option) any later version."
    echo -e ""
    echo -e "This program is distributed in the hope that it will be useful,"
    echo -e "but WITHOUT ANY WARRANTY; without even the implied warranty of"
    echo -e "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
    echo -e "GNU General Public License for more details."
    echo -e ""
    echo -e "You should have received a copy of the GNU General Public License"
    echo -e "along with this program.  If not, see <https://www.gnu.org/licenses/>.${NC}"
}

# Función para secciones con formato
section() {
    echo -e "\n${PURPLE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${YELLOW} $1${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════╝${NC}"
}

# Función para items con formato
item() {
    printf "${GREEN}%-25s${NC} : ${WHITE}%s${NC}\n" "$1" "$2"
}

# Función para barras de progreso
progress_bar() {
    local value=$1
    local max=$2
    local label=$3
    local width=30
    local percentage=$((value * 100 / max))
    local filled=$((width * value / max))
    local empty=$((width - filled))
    
    printf "${CYAN}%-20s${NC} [" "$label"
    printf "${GREEN}%-${filled}s${NC}" "" | sed 's/ /█/g'
    printf "${WHITE}%-${empty}s${NC}" "" | sed 's/ /░/g'
    printf "] ${YELLOW}%3d%%${NC}\n" "$percentage"
}

# Información del sistema
system_info() {
    section "SYSTEM INFORMATION"
    
    item "Hostname" "$(hostname)"
    item "Kernel" "$(uname -r)"
    item "OS" "$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '\"')"
    item "Uptime" "$(uptime -p | sed 's/up //')"
    item "Architecture" "$(arch)"
}

# Información de la CPU con registros
cpu_info() {
    section "PROCESSOR INFORMATION"
    
    local cpu_model=$(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)
    local cores=$(grep -c "processor" /proc/cpuinfo)
    local threads=$(lscpu | grep "CPU(s):" | head -1 | awk '{print $2}')
    local socket=$(lscpu | grep "Socket(s):" | awk '{print $2}')
    local vendor=$(lscpu | grep "Vendor ID:" | awk '{print $3}')
    
    item "Model" "$cpu_model"
    item "Vendor" "$vendor"
    item "Socket" "$socket"
    item "Cores/Threads" "$cores cores, $threads threads"
    item "Frequency" "$(lscpu | grep "MHz" | head -1 | awk '{print $3 " MHz"}')"
    item "Max Frequency" "$(lscpu | grep "CPU max MHz" | awk '{print $4 " MHz"}')"
    
    # Información de caché
    local l1d=$(lscpu | grep "L1d cache" | awk -F: '{print $2}' | xargs)
    local l1i=$(lscpu | grep "L1i cache" | awk -F: '{print $2}' | xargs)
    local l2=$(lscpu | grep "L2 cache" | awk -F: '{print $2}' | xargs)
    local l3=$(lscpu | grep "L3 cache" | awk -F: '{print $2}' | xargs)
    
    [ -n "$l1d" ] && item "L1d Cache" "$l1d"
    [ -n "$l1i" ] && item "L1i Cache" "$l1i"
    [ -n "$l2" ] && item "L2 Cache" "$l2"
    [ -n "$l3" ] && item "L3 Cache" "$l3"
    
    # Registros y extensiones de la CPU
    echo -e "\n${BLUE}CPU Features & Registers:${NC}"
    local flags=$(lscpu | grep "Flags:" | awk -F: '{print $2}' | xargs)
    if [ -n "$flags" ]; then
        echo -e "${WHITE}$flags${NC}" | fold -w 80 -s
    else
        # Alternativa si no hay flags en lscpu
        local features=$(grep flags /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)
        echo -e "${WHITE}$features${NC}" | fold -w 80 -s
    fi
    
    # Uso de CPU
    local cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print int(usage)}')
    progress_bar $cpu_usage 100 "CPU Usage"
}

# Información de la placa base
motherboard_info() {
    section "MOTHERBOARD INFORMATION"
    
    # Información básica de la placa base
    if [ -f /sys/devices/virtual/dmi/id/board_vendor ]; then
        local board_vendor=$(cat /sys/devices/virtual/dmi/id/board_vendor 2>/dev/null || echo "Unknown")
        local board_name=$(cat /sys/devices/virtual/dmi/id/board_name 2>/dev/null || echo "Unknown")
        local board_version=$(cat /sys/devices/virtual/dmi/id/board_version 2>/dev/null || echo "Unknown")
        local bios_vendor=$(cat /sys/devices/virtual/dmi/id/bios_vendor 2>/dev/null || echo "Unknown")
        local bios_version=$(cat /sys/devices/virtual/dmi/id/bios_version 2>/dev/null || echo "Unknown")
        local bios_date=$(cat /sys/devices/virtual/dmi/id/bios_date 2>/dev/null || echo "Unknown")
        
        item "Motherboard Vendor" "$board_vendor"
        item "Motherboard Model" "$board_name"
        item "Board Version" "$board_version"
        item "BIOS Vendor" "$bios_vendor"
        item "BIOS Version" "$bios_version"
        item "BIOS Date" "$bios_date"
    else
        # Alternativa usando dmidecode si está disponible
        if command -v dmidecode &> /dev/null; then
            local board_vendor=$(dmidecode -s baseboard-manufacturer 2>/dev/null || echo "Unknown")
            local board_name=$(dmidecode -s baseboard-product-name 2>/dev/null || echo "Unknown")
            local bios_vendor=$(dmidecode -s bios-vendor 2>/dev/null || echo "Unknown")
            local bios_version=$(dmidecode -s bios-version 2>/dev/null || echo "Unknown")
            
            item "Motherboard Vendor" "$board_vendor"
            item "Motherboard Model" "$board_name"
            item "BIOS Vendor" "$bios_vendor"
            item "BIOS Version" "$bios_version"
        else
            item "Motherboard Info" "DMI information not available"
        fi
    fi
    
    # Información de chipsets y buses
    echo -e "\n${BLUE}Chipset & Bus Information:${NC}"
    if command -v lspci &> /dev/null; then
        local chipset=$(lspci | grep -i "chipset" | head -1 | cut -d: -f3- | xargs)
        local bridge=$(lspci | grep -i "bridge" | head -1 | cut -d: -f3- | xargs)
        
        [ -n "$chipset" ] && item "Chipset" "$chipset"
        [ -n "$bridge" ] && item "Bridge" "$bridge"
        
        # Slots PCIe disponibles
        local pcie_slots=$(lspci | grep -c "PCI")
        item "PCIe Devices" "$pcie_slots devices detected"
    fi
    
    # Información de USB
    if [ -d /sys/bus/usb/devices ]; then
        local usb_ports=$(ls /sys/bus/usb/devices/ | grep -c "^[0-9]*-[0-9]")
        item "USB Controllers" "$usb_ports ports detected"
    fi
}

# Información de memoria
memory_info() {
    section "MEMORY INFORMATION"
    
    local total_mem=$(free -h | grep Mem: | awk '{print $2}')
    local used_mem=$(free -h | grep Mem: | awk '{print $3}')
    local free_mem=$(free -h | grep Mem: | awk '{print $4}')
    local mem_percent=$(free | grep Mem: | awk '{printf "%.0f", $3/$2 * 100}')
    
    item "Total RAM" "$total_mem"
    item "Used RAM" "$used_mem"
    item "Free RAM" "$free_mem"
    progress_bar $mem_percent 100 "Memory Usage"
    
    # Información de slots de memoria
    if command -v dmidecode &> /dev/null; then
        local mem_slots=$(dmidecode -t memory 2>/dev/null | grep -c "Size:" | awk '{print $1}')
        local mem_used_slots=$(dmidecode -t memory 2>/dev/null | grep -c "Size: [0-9][0-9]*" | awk '{print $1}')
        
        if [ -n "$mem_slots" ] && [ "$mem_slots" -gt 0 ]; then
            item "Memory Slots" "$mem_used_slots/$mem_slots used"
        fi
    fi
    
    # Información de swap
    local swap_total=$(free -h | grep Swap: | awk '{print $2}')
    local swap_used=$(free -h | grep Swap: | awk '{print $3}')
    item "Swap Total" "$swap_total"
    item "Swap Used" "$swap_used"
}

# Información de almacenamiento
storage_info() {
    section "STORAGE INFORMATION"
    
    # Discos principales
    local root_size=$(df -h / | awk 'NR==2 {print $2}')
    local root_used=$(df -h / | awk 'NR==2 {print $3}')
    local root_avail=$(df -h / | awk 'NR==2 {print $4}')
    local root_percent=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
    
    item "Root Size" "$root_size"
    item "Root Used" "$root_used"
    item "Root Available" "$root_avail"
    progress_bar $root_percent 100 "Root Partition"
    
    # Información de discos
    echo -e "\n${BLUE}Storage Devices:${NC}"
    if command -v lsblk &> /dev/null; then
        lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,FSTYPE | grep -v loop | head -10
    else
        df -h | head -10
    fi
    
    # Información de controladores SATA/NVMe
    if command -v lspci &> /dev/null; then
        echo -e "\n${BLUE}Storage Controllers:${NC}"
        lspci | grep -i "SATA\|NVMe\|storage" | head -5
    fi
}

# Información de GPU
gpu_info() {
    section "GRAPHICS INFORMATION"
    
    if command -v lspci &> /dev/null; then
        local gpu_info=$(lspci | grep -i "VGA\|3D\|Display" | head -1 | cut -d: -f3- | xargs)
        if [ -n "$gpu_info" ]; then
            item "GPU Model" "$gpu_info"
        else
            item "GPU Model" "No dedicated GPU detected"
        fi
        
        # Información adicional de GPU
        local gpu_count=$(lspci | grep -c -i "VGA\|3D\|Display")
        item "GPU Count" "$gpu_count"
    else
        item "GPU Info" "lspci not available"
    fi
}

# Información de red
network_info() {
    section "NETWORK INFORMATION"
    
    local ip_addr=$(hostname -I | awk '{print $1}')
    local gateway=$(ip route | grep default | awk '{print $3}' | head -1)
    
    item "IP Address" "$ip_addr"
    item "Gateway" "$gateway"
    
    # Interfaces de red
    echo -e "\n${BLUE}Network Interfaces:${NC}"
    ip -o addr show | awk '{print $2, $4}' | head -5
    
    # Controladores de red
    if command -v lspci &> /dev/null; then
        echo -e "\n${BLUE}Network Controllers:${NC}"
        lspci | grep -i "network\|ethernet" | head -3
    fi
}

# Información de temperatura (si está disponible)
temp_info() {
    section "TEMPERATURE INFORMATION"
    
    if [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then
        local temp=$(cat /sys/class/thermal/thermal_zone0/temp)
        local temp_c=$((temp/1000))
        
        if [ $temp_c -lt 50 ]; then
            color=$GREEN
        elif [ $temp_c -lt 70 ]; then
            color=$YELLOW
        else
            color=$RED
        fi
        
        item "CPU Temperature" "${color}${temp_c}°C${NC}"
        progress_bar $temp_c 100 "Temp Level"
    else
        item "Temperature" "Sensors not available"
    fi
}

# Información detallada de CPU y Motherboard
cpu_motherboard_detail() {
    section "DETAILED CPU & MOTHERBOARD INFO"
    cpu_info
    motherboard_info
}

# Vista completa del sistema
full_system_info() {
    show_header
    system_info
    cpu_info
    motherboard_info
    memory_info
    storage_info
    gpu_info
    network_info
    temp_info
    
    echo -e "\n${GREEN}✓ Full system scan completed${NC}"
}

# Vista rápida (solo información esencial)
quick_info() {
    show_header
    section "QUICK SYSTEM OVERVIEW"
    
    item "Hostname" "$(hostname)"
    item "CPU" "$(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)"
    item "Motherboard" "$(cat /sys/devices/virtual/dmi/id/board_name 2>/dev/null || echo "Unknown")"
    item "Memory" "$(free -h | grep Mem: | awk '{print $2 " total, " $3 " used"}')"
    item "Disk" "$(df -h / | awk 'NR==2 {print $2 " total, " $3 " used"}')"
    item "Uptime" "$(uptime -p | sed 's/up //')"
    
    echo -e "\n${GREEN}✓ Quick scan completed${NC}"
}

# Menú principal actualizado
show_menu() {
    echo -e "\n${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${WHITE}                     SELECT AN OPTION                     ${CYAN}║${NC}"
    echo -e "${CYAN}╠══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC} ${GREEN}1${NC}) Full System Information                          ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${GREEN}2${NC}) Quick System Overview                            ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${GREEN}3${NC}) CPU & Motherboard Detailed                       ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${GREEN}4${NC}) CPU & Memory Only                                ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${GREEN}5${NC}) Storage Information                              ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${GREEN}6${NC}) Network Information                              ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${GREEN}7${NC}) Motherboard Information                          ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${GREEN}8${NC}) License Information                              ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${RED}0${NC}) Exit                                          ${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo -n -e "${YELLOW}Select option [0-8]: ${NC}"
}

# Función principal
main() {
    # Verificar si hwinfo está instalado, si no usar alternativas
    if ! command -v hwinfo &> /dev/null; then
        echo -e "${YELLOW}Note: hwinfo not found, using system utilities instead${NC}"
        sleep 2
    fi
    
    while true; do
        show_menu
        read choice
        
        case $choice in
            1)
                full_system_info
                ;;
            2)
                quick_info
                ;;
            3)
                show_header
                cpu_motherboard_detail
                ;;
            4)
                show_header
                cpu_info
                memory_info
                ;;
            5)
                show_header
                storage_info
                ;;
            6)
                show_header
                network_info
                ;;
            7)
                show_header
                motherboard_info
                ;;
            8)
                show_header
                show_license
                ;;
            0)
                echo -e "${GREEN}Thank you for using HWINFO System Info Plus!${NC}"
                echo -e "${BLUE}Visit: https://youtube.com/@competencia_digital${NC}"
                echo -e "${GREEN}Website: https://competenciadigital.name${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option! Please select 0-8${NC}"
                ;;
        esac
        
        echo -e "\n${CYAN}Press Enter to continue...${NC}"
        read
    done
}

# Ejecutar programa
main "$@"
