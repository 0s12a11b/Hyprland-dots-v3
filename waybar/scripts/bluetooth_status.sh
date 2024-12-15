#!/bin/bash

DEVICE="" # MAC-адрес устройства
STATUS_FILE="/tmp/bluetooth_$DEVICE"

# Проверяем, подключено ли устройство
if bluetoothctl info "$DEVICE" | grep -q "Connected: yes"; then
  # Если подключено, пытаемся узнать заряд батареи
  BATTERY_INFO=$(bluetoothctl info "$DEVICE" | grep "Battery Percentage")
  
  # Извлекаем значение процента из строки, если оно есть
  BATTERY=$(echo "$BATTERY_INFO" | grep -oP "\(\d+\)" | tr -d '()')
  ICON="󰂱" # Иконка по умолчанию

  if [ -n "$BATTERY" ]; then
    if [ "$BATTERY" -ge 100 ]; then
      ICON="󰥉"
    elif [ "$BATTERY" -ge 90 ]; then
      ICON="󰥆"
    elif [ "$BATTERY" -ge 80 ]; then
      ICON="󰥅"
    elif [ "$BATTERY" -ge 70 ]; then
      ICON="󰥄"
    elif [ "$BATTERY" -ge 60 ]; then
      ICON="󰥃"
    elif [ "$BATTERY" -ge 50 ]; then
      ICON="󰥂"
    elif [ "$BATTERY" -ge 40 ]; then
      ICON="󰥁"
    elif [ "$BATTERY" -ge 30 ]; then
      ICON="󰥀"
    elif [ "$BATTERY" -ge 20 ]; then
      ICON="󰤿"
    else
      ICON="󰥇"
    fi
  fi

  echo "{\"text\": \"$ICON\", \"tooltip\": \"Battery: $BATTERY%\", \"class\": \"connected\"}"
else
  echo "{\"text\": \"󰂲\", \"class\": \"disconnected\"}"
fi