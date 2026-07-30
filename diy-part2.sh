#!/bin/bash
# Накатываем патч для поддержки Cudy WR1300 v4
curl -L 'https://ozlabs.org' | git am

# Жестко прописываем таргет, архитектуру и конкретное устройство
echo "CONFIG_TARGET_ramips=y" > .config
echo "CONFIG_TARGET_ramips_mt7621=y" >> .config
echo "CONFIG_TARGET_DEVICE_ramips_mt7621_DEVICE_cudy_wr1300-v4=y" >> .config

# Отключаем сборку всех остальных плат, чтобы не собирался дефолтный adslr
echo "CONFIG_TARGET_MULTI_PROFILE=n" >> .config
echo "CONFIG_TARGET_PER_DEVICE_ROOTFS=y" >> .config
