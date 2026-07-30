#!/bin/bash
# Скачиваем и накладываем патч для поддержки Cudy WR1300 v4
curl -L 'https://ozlabs.org' | git am

# Принудительно создаем файл конфигурации .config под твою модель
echo "CONFIG_TARGET_ramips=y" > .config
echo "CONFIG_TARGET_ramips_mt7621=y" >> .config
echo "CONFIG_TARGET_DEVICE_ramips_mt7621_DEVICE_cudy_wr1300-v4=y" >> .config
