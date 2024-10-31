#!/usr/bin/env bash

date

echo -e "\nOS: $(uname -nm)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p | cut -d' ' -f2-)"
# echo "Terminal: $TERM_PROGRAM $TERM_PROGRAM_VERSION"
echo "CPU: $(cat /proc/cpuinfo | grep "model name" | uniq | cut -d ':' -f 2 | xargs)"
echo "GPU: $(cat /sys/class/drm/card*/device/uevent | grep "DRIVER=" | head -n 1 | cut -d '=' -f 2)"
echo "Storage: $(df -h / | awk 'NR==2 {print $3}') / $(df -h / | awk 'NR==2 {print $2}') ($(df -T / | awk 'NR==2 {print $2}'))"
echo "Battery: $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage:" | awk '{print $2}') ($(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state:" | awk '{print $2}'))"
