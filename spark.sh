color="\033[0;32m"
end="\033[0m"

echo -e "${color}Initializing your local repository${end}"
repo init --depth=1 --no-repo-verify -u https://github.com/BuildBots-Den/manifest_spark -b pyro-next

echo -e "${color}Syncing Repo${end}"
repo sync --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)

echo  -e "${color}Cloning DeviceTree For spes/n | Redmi note 11${end}"
git clone https://github.com/sayann70/derp device/xiaomi/spes

echo -e "${color}Build Process Started${end}"
. build/envsetup.sh
lunch spark_spes-userdebug
make bacon -j"$(nproc --all)"
