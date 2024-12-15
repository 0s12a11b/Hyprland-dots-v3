#!/bin/bash

# Проверяем, запущен ли процесс ciadpi
if pgrep -x "ciadpi" > /dev/null; then
  # Если процесс запущен, убиваем его
  killall ciadpi
  echo "off" > /tmp/ciadpi_status
else
  # Если процесс не запущен, запускаем его
  ciadpi --oob 1 &
  echo "on" > /tmp/ciadpi_status
fi