#!/bin/bash

# отчёт раз в час: собирает вывод 4 скриптов в один файл и удаляет отчёты старше недели

REPORT="/home/asur/reports/report_$(date +%Y-%m-%d_%H%M).txt"  # имя файла с датой и временем создания

mkdir -p /home/asur/reports  # создать каталог если его нет

{
    /home/asur/ip_log_asur.sh      # IP с наибольшим числом запросов
    /home/asur/url_log_asur.sh     # URL с наибольшим числом запросов
    /home/asur/error_log_asur.sh  # ошибки веб-сервера/приложения
    /home/asur/http_log_asur.sh    # HTTP-коды ответов
} > "$REPORT"                      # всё в один файл (перезапись)

find /home/asur/reports -name 'report_*.txt' -mtime +7 -delete  # удалить отчёты старше 7 суток
