#!/bin/bash
# 1. Накатываем патч для поддержки Cudy WR1300 v4
curl -L 'https://ozlabs.org' | git am

# 2. Генерируем правильный синтаксис конфига
echo "CONFIG_TARGET_ramips=y" > .config
echo "CONFIG_TARGET_ramips_mt7621=y" >> .config
echo "CONFIG_TARGET_DEVICE_ramips_mt7621_DEVICE_cudy_wr1300-v4=y" >> .config

# 3. Отключаем мультипрофили (чтобы убить adslr_g7)
echo "CONFIG_TARGET_MULTI_PROFILE=n" >> .config
echo "CONFIG_TARGET_ALL_PROFILES=n" >> .config

# 4. Принудительно заставляем компилятор выплюнуть FACTORY образ
echo "CONFIG_TARGET_PER_DEVICE_ROOTFS=y" >> .config
