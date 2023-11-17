color="\033[0;32m"
end="\033[0m"

echo -e "${color}Initializing your local repository${end}"
repo init -u https://github.com/ProjectBlaze/manifest -b 14

echo -e "${color}Syncing Repo${end}"
repo sync -c -j$(nproc --all) --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune

echo  -e "${color}Cloning DeviceTree For spes/n | Redmi note 11${end}"
git clone https://github.com/ProjectBlaze-Devices/device_xiaomi_spes device/xiaomi/spes

echo -e "${color}Build Process Started${end}"
. build/envsetup.sh
lunch blaze_spes-userdebug
make bacon -j"$(nproc --all)"
