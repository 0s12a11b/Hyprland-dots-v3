#!/bin/bash

DEVICE="7C:C9:5E:28:4D:0F" # MAC-адрес устройства
STATUS_FILE="/tmp/bluetooth_$DEVICE"

if bluetoothctl info "$DEVICE" | grep -q "Connected: yes"; then
  # Если устройство подключено, отключаем
  bluetoothctl disconnect "$DEVICE"
  echo "disconnected" > "$STATUS_FILE"
else
  # Если устройство не подключено, подключаем
  bluetoothctl connect "$DEVICE"
  echo "connected" > "$STATUS_FILE"
fi