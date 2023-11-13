echo "Cloning Trees For spes/Redmi note 11"
git clone https://github.com/ProjectBlaze-Devices/device_xiaomi_spes device/xiaomi/spes

echo "Build Process Started"
. build/envsetup.sh
lunch blaze_spes-userdebug
make bacon -j"$(nproc --all)"