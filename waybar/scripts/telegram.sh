#!/bin/bash

# Проверяем, запущен ли процесс Telegram Desktop
if pgrep -x "telegram-desktop" > /dev/null; then
    # Если процесс запущен, проверяем наличие окна
    WIN_ID=$(wmctrl -lx | grep "telegram-desktop.Telegram" | awk '{print $1}')
    if [ -n "$WIN_ID" ]; then
        # Если окно найдено, перемещаем его на текущий рабочий стол
        wmctrl -i -R "$WIN_ID"
    else
        # Если окно скрыто или свернуто, открываем приложение
        telegram-desktop &
    fi
else
    # Если процесс не запущен, запускаем приложение
    telegram-desktop &
fi

