#!/bin/bash

set -e

if ! command -v wget 2>&1 >/dev/null; then
    echo "ERROR: Missing prerequisite: wget"
    exit 1
fi

if ! command -v unzip 2>&1 >/dev/null; then
    echo "ERROR: Missing prerequisite: unzip"
    exit 1
fi

# Linux: https://corretto.aws/downloads/resources/21.0.2.13.1/amazon-corretto-21.0.2.13.1-linux-x64-jdk.zip
# OSX: https://corretto.aws/downloads/resources/21.0.5.11.1/amazon-corretto-21.0.5.11.1-macosx-x64.tar.gz

# Make sure that we actually have game files first
if [ ! -f ./ufo50/data.win ]; then
	echo "Place your UFO 50 game files in the ufo50 folder first!"
	read -n 1 -s -r -p "Press any key to continue..."
	echo
	exit 1
fi

# Permissions
chmod +x ./bin/zipalign-osx
chmod +x ./bin/aapt-osx

# Clean up from any previous runs
rm -f ./UFO50Wrapper.apk
rm -f ./com.unofficial.ufo50.zip
rm -rf ./assets
mkdir ./assets

# Copy required assets
echo "Preparing assets..."
cp -r ./ufo50/ext ./assets/ext
cp -r ./ufo50/Textures ./assets/Textures
cp ./ufo50/*.dat ./assets/
cp ./ufo50/options.ini ./assets/
cp ./ufo50/data.win ./assets/game.droid
cp ./base/AndroidWrapper2024.8.0.216_VM_debug.apk ./UFO50Wrapper.apk

# Download Java, if needed
if [ ! -f ./bin/java/Contents/Home/bin/java ]; then
	ARCH="x64"
	if [[ $(uname -m) == 'arm64' ]]; then
		ARCH="aarch64"
	fi

	rm -rf ./bin/java
	echo "Downloading java..."
	wget https://corretto.aws/downloads/resources/21.0.6.7.1/amazon-corretto-21.0.6.7.1-macosx-${ARCH}.tar.gz -O ./jdk.tar.gz
	echo "Extracting java..."
	tar -zxvf ./jdk.tar.gz
	mv ./amazon-corretto-21.jdk ./bin/java
	rm -f ./jdk.tar.gz
fi

# Clean wrapper apk
echo "Preparing wrapper..."
./bin/aapt-osx remove -f -v UFO50Wrapper.apk assets/options.ini
./bin/aapt-osx remove -f -v UFO50Wrapper.apk assets/game.droid

# Add game assets to base wrapper APK
echo "Building wrapper..."
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/audiogroup1.dat assets/audiogroup2.dat assets/audiogroup3.dat assets/audiogroup4.dat assets/audiogroup5.dat assets/audiogroup6.dat assets/audiogroup7.dat assets/audiogroup8.dat assets/audiogroup9.dat
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/audiogroup10.dat assets/audiogroup11.dat assets/audiogroup12.dat assets/audiogroup13.dat assets/audiogroup14.dat assets/audiogroup15.dat assets/audiogroup16.dat assets/audiogroup17.dat assets/audiogroup18.dat assets/audiogroup19.dat
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/audiogroup20.dat assets/audiogroup21.dat assets/audiogroup22.dat assets/audiogroup23.dat assets/audiogroup24.dat assets/audiogroup25.dat assets/audiogroup26.dat assets/audiogroup27.dat assets/audiogroup28.dat assets/audiogroup29.dat
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/audiogroup30.dat assets/audiogroup31.dat assets/audiogroup32.dat assets/audiogroup33.dat assets/audiogroup34.dat assets/audiogroup35.dat assets/audiogroup36.dat assets/audiogroup37.dat assets/audiogroup38.dat assets/audiogroup39.dat
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/audiogroup40.dat assets/audiogroup41.dat assets/audiogroup43.dat assets/audiogroup44.dat assets/audiogroup45.dat assets/audiogroup46.dat assets/audiogroup47.dat assets/audiogroup48.dat assets/audiogroup49.dat
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/audiogroup50.dat assets/audiogroup51.dat assets/audiogroup52.dat assets/audiogroup53.dat
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/0_Text.json assets/ext/ENGLISH/1_Text.json assets/ext/ENGLISH/2_Text.json assets/ext/ENGLISH/3_Text.json assets/ext/ENGLISH/4_Text.json assets/ext/ENGLISH/5_Text.json assets/ext/ENGLISH/6_Text.json assets/ext/ENGLISH/7_Text.json assets/ext/ENGLISH/8_Text.json assets/ext/ENGLISH/9_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/10_Text.json assets/ext/ENGLISH/11_Text.json assets/ext/ENGLISH/12_Text.json assets/ext/ENGLISH/13_Text.json assets/ext/ENGLISH/14_Text.json assets/ext/ENGLISH/15_Text.json assets/ext/ENGLISH/16_Text.json assets/ext/ENGLISH/17_Text.json assets/ext/ENGLISH/18_Text.json assets/ext/ENGLISH/19_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/20_Text.json assets/ext/ENGLISH/21_Text.json assets/ext/ENGLISH/22_Text.json assets/ext/ENGLISH/23_Text.json assets/ext/ENGLISH/24_Text.json assets/ext/ENGLISH/25_Text.json assets/ext/ENGLISH/26_Text.json assets/ext/ENGLISH/27_Text.json assets/ext/ENGLISH/28_Text.json assets/ext/ENGLISH/29_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/30_Text.json assets/ext/ENGLISH/31_Text.json assets/ext/ENGLISH/32_Text.json assets/ext/ENGLISH/33_Text.json assets/ext/ENGLISH/34_Text.json assets/ext/ENGLISH/35_Text.json assets/ext/ENGLISH/36_Text.json assets/ext/ENGLISH/37_Text.json assets/ext/ENGLISH/38_Text.json assets/ext/ENGLISH/39_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/ENGLISH/40_Text.json assets/ext/ENGLISH/41_Text.json assets/ext/ENGLISH/42_Text.json assets/ext/ENGLISH/43_Text.json assets/ext/ENGLISH/44_Text.json assets/ext/ENGLISH/45_Text.json assets/ext/ENGLISH/46_Text.json assets/ext/ENGLISH/47_Text.json assets/ext/ENGLISH/48_Text.json assets/ext/ENGLISH/49_Text.json assets/ext/ENGLISH/50_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/FRENCH/0_Text.json assets/ext/FRENCH/1_Text.json assets/ext/FRENCH/2_Text.json assets/ext/FRENCH/3_Text.json assets/ext/FRENCH/4_Text.json assets/ext/FRENCH/5_Text.json assets/ext/FRENCH/6_Text.json assets/ext/FRENCH/7_Text.json assets/ext/FRENCH/8_Text.json assets/ext/FRENCH/9_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/FRENCH/10_Text.json assets/ext/FRENCH/11_Text.json assets/ext/FRENCH/12_Text.json assets/ext/FRENCH/13_Text.json assets/ext/FRENCH/14_Text.json assets/ext/FRENCH/15_Text.json assets/ext/FRENCH/16_Text.json assets/ext/FRENCH/17_Text.json assets/ext/FRENCH/18_Text.json assets/ext/FRENCH/19_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/FRENCH/20_Text.json assets/ext/FRENCH/21_Text.json assets/ext/FRENCH/22_Text.json assets/ext/FRENCH/23_Text.json assets/ext/FRENCH/24_Text.json assets/ext/FRENCH/25_Text.json assets/ext/FRENCH/26_Text.json assets/ext/FRENCH/27_Text.json assets/ext/FRENCH/28_Text.json assets/ext/FRENCH/29_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/FRENCH/30_Text.json assets/ext/FRENCH/31_Text.json assets/ext/FRENCH/32_Text.json assets/ext/FRENCH/33_Text.json assets/ext/FRENCH/34_Text.json assets/ext/FRENCH/35_Text.json assets/ext/FRENCH/36_Text.json assets/ext/FRENCH/37_Text.json assets/ext/FRENCH/38_Text.json assets/ext/FRENCH/39_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/FRENCH/40_Text.json assets/ext/FRENCH/41_Text.json assets/ext/FRENCH/42_Text.json assets/ext/FRENCH/43_Text.json assets/ext/FRENCH/44_Text.json assets/ext/FRENCH/45_Text.json assets/ext/FRENCH/46_Text.json assets/ext/FRENCH/47_Text.json assets/ext/FRENCH/48_Text.json assets/ext/FRENCH/49_Text.json assets/ext/FRENCH/50_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/GERMAN/0_Text.json assets/ext/GERMAN/1_Text.json assets/ext/GERMAN/2_Text.json assets/ext/GERMAN/3_Text.json assets/ext/GERMAN/4_Text.json assets/ext/GERMAN/5_Text.json assets/ext/GERMAN/6_Text.json assets/ext/GERMAN/7_Text.json assets/ext/GERMAN/8_Text.json assets/ext/GERMAN/9_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/GERMAN/10_Text.json assets/ext/GERMAN/11_Text.json assets/ext/GERMAN/12_Text.json assets/ext/GERMAN/13_Text.json assets/ext/GERMAN/14_Text.json assets/ext/GERMAN/15_Text.json assets/ext/GERMAN/16_Text.json assets/ext/GERMAN/17_Text.json assets/ext/GERMAN/18_Text.json assets/ext/GERMAN/19_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/GERMAN/20_Text.json assets/ext/GERMAN/21_Text.json assets/ext/GERMAN/22_Text.json assets/ext/GERMAN/23_Text.json assets/ext/GERMAN/24_Text.json assets/ext/GERMAN/25_Text.json assets/ext/GERMAN/26_Text.json assets/ext/GERMAN/27_Text.json assets/ext/GERMAN/28_Text.json assets/ext/GERMAN/29_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/GERMAN/30_Text.json assets/ext/GERMAN/31_Text.json assets/ext/GERMAN/32_Text.json assets/ext/GERMAN/33_Text.json assets/ext/GERMAN/34_Text.json assets/ext/GERMAN/35_Text.json assets/ext/GERMAN/36_Text.json assets/ext/GERMAN/37_Text.json assets/ext/GERMAN/38_Text.json assets/ext/GERMAN/39_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/GERMAN/40_Text.json assets/ext/GERMAN/41_Text.json assets/ext/GERMAN/42_Text.json assets/ext/GERMAN/43_Text.json assets/ext/GERMAN/44_Text.json assets/ext/GERMAN/45_Text.json assets/ext/GERMAN/46_Text.json assets/ext/GERMAN/47_Text.json assets/ext/GERMAN/48_Text.json assets/ext/GERMAN/49_Text.json assets/ext/GERMAN/50_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/0_Text.json assets/ext/ITALIAN/1_Text.json assets/ext/ITALIAN/2_Text.json assets/ext/ITALIAN/3_Text.json assets/ext/ITALIAN/4_Text.json assets/ext/ITALIAN/5_Text.json assets/ext/ITALIAN/6_Text.json assets/ext/ITALIAN/7_Text.json assets/ext/ITALIAN/8_Text.json assets/ext/ITALIAN/9_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/10_Text.json assets/ext/ITALIAN/11_Text.json assets/ext/ITALIAN/12_Text.json assets/ext/ITALIAN/13_Text.json assets/ext/ITALIAN/14_Text.json assets/ext/ITALIAN/15_Text.json assets/ext/ITALIAN/16_Text.json assets/ext/ITALIAN/17_Text.json assets/ext/ITALIAN/18_Text.json assets/ext/ITALIAN/19_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/20_Text.json assets/ext/ITALIAN/21_Text.json assets/ext/ITALIAN/22_Text.json assets/ext/ITALIAN/23_Text.json assets/ext/ITALIAN/24_Text.json assets/ext/ITALIAN/25_Text.json assets/ext/ITALIAN/26_Text.json assets/ext/ITALIAN/27_Text.json assets/ext/ITALIAN/28_Text.json assets/ext/ITALIAN/29_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/30_Text.json assets/ext/ITALIAN/31_Text.json assets/ext/ITALIAN/32_Text.json assets/ext/ITALIAN/33_Text.json assets/ext/ITALIAN/34_Text.json assets/ext/ITALIAN/35_Text.json assets/ext/ITALIAN/36_Text.json assets/ext/ITALIAN/37_Text.json assets/ext/ITALIAN/38_Text.json assets/ext/ITALIAN/39_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/ITALIAN/40_Text.json assets/ext/ITALIAN/41_Text.json assets/ext/ITALIAN/42_Text.json assets/ext/ITALIAN/43_Text.json assets/ext/ITALIAN/44_Text.json assets/ext/ITALIAN/45_Text.json assets/ext/ITALIAN/46_Text.json assets/ext/ITALIAN/47_Text.json assets/ext/ITALIAN/48_Text.json assets/ext/ITALIAN/49_Text.json assets/ext/ITALIAN/50_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/0_Text.json assets/ext/PORTUGUESE/1_Text.json assets/ext/PORTUGUESE/2_Text.json assets/ext/PORTUGUESE/3_Text.json assets/ext/PORTUGUESE/4_Text.json assets/ext/PORTUGUESE/5_Text.json assets/ext/PORTUGUESE/6_Text.json assets/ext/PORTUGUESE/7_Text.json assets/ext/PORTUGUESE/8_Text.json assets/ext/PORTUGUESE/9_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/10_Text.json assets/ext/PORTUGUESE/11_Text.json assets/ext/PORTUGUESE/12_Text.json assets/ext/PORTUGUESE/13_Text.json assets/ext/PORTUGUESE/14_Text.json assets/ext/PORTUGUESE/15_Text.json assets/ext/PORTUGUESE/16_Text.json assets/ext/PORTUGUESE/17_Text.json assets/ext/PORTUGUESE/18_Text.json assets/ext/PORTUGUESE/19_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/20_Text.json assets/ext/PORTUGUESE/21_Text.json assets/ext/PORTUGUESE/22_Text.json assets/ext/PORTUGUESE/23_Text.json assets/ext/PORTUGUESE/24_Text.json assets/ext/PORTUGUESE/25_Text.json assets/ext/PORTUGUESE/26_Text.json assets/ext/PORTUGUESE/27_Text.json assets/ext/PORTUGUESE/28_Text.json assets/ext/PORTUGUESE/29_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/30_Text.json assets/ext/PORTUGUESE/31_Text.json assets/ext/PORTUGUESE/32_Text.json assets/ext/PORTUGUESE/33_Text.json assets/ext/PORTUGUESE/34_Text.json assets/ext/PORTUGUESE/35_Text.json assets/ext/PORTUGUESE/36_Text.json assets/ext/PORTUGUESE/37_Text.json assets/ext/PORTUGUESE/38_Text.json assets/ext/PORTUGUESE/39_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/PORTUGUESE/40_Text.json assets/ext/PORTUGUESE/41_Text.json assets/ext/PORTUGUESE/42_Text.json assets/ext/PORTUGUESE/43_Text.json assets/ext/PORTUGUESE/44_Text.json assets/ext/PORTUGUESE/45_Text.json assets/ext/PORTUGUESE/46_Text.json assets/ext/PORTUGUESE/47_Text.json assets/ext/PORTUGUESE/48_Text.json assets/ext/PORTUGUESE/49_Text.json assets/ext/PORTUGUESE/50_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/SPANISH/0_Text.json assets/ext/SPANISH/1_Text.json assets/ext/SPANISH/2_Text.json assets/ext/SPANISH/3_Text.json assets/ext/SPANISH/4_Text.json assets/ext/SPANISH/5_Text.json assets/ext/SPANISH/6_Text.json assets/ext/SPANISH/7_Text.json assets/ext/SPANISH/8_Text.json assets/ext/SPANISH/9_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/SPANISH/10_Text.json assets/ext/SPANISH/11_Text.json assets/ext/SPANISH/12_Text.json assets/ext/SPANISH/13_Text.json assets/ext/SPANISH/14_Text.json assets/ext/SPANISH/15_Text.json assets/ext/SPANISH/16_Text.json assets/ext/SPANISH/17_Text.json assets/ext/SPANISH/18_Text.json assets/ext/SPANISH/19_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/SPANISH/20_Text.json assets/ext/SPANISH/21_Text.json assets/ext/SPANISH/22_Text.json assets/ext/SPANISH/23_Text.json assets/ext/SPANISH/24_Text.json assets/ext/SPANISH/25_Text.json assets/ext/SPANISH/26_Text.json assets/ext/SPANISH/27_Text.json assets/ext/SPANISH/28_Text.json assets/ext/SPANISH/29_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/SPANISH/30_Text.json assets/ext/SPANISH/31_Text.json assets/ext/SPANISH/32_Text.json assets/ext/SPANISH/33_Text.json assets/ext/SPANISH/34_Text.json assets/ext/SPANISH/35_Text.json assets/ext/SPANISH/36_Text.json assets/ext/SPANISH/37_Text.json assets/ext/SPANISH/38_Text.json assets/ext/SPANISH/39_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/ext/SPANISH/40_Text.json assets/ext/SPANISH/41_Text.json assets/ext/SPANISH/42_Text.json assets/ext/SPANISH/43_Text.json assets/ext/SPANISH/44_Text.json assets/ext/SPANISH/45_Text.json assets/ext/SPANISH/46_Text.json assets/ext/SPANISH/47_Text.json assets/ext/SPANISH/48_Text.json assets/ext/SPANISH/49_Text.json assets/ext/SPANISH/50_Text.json
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup00_library_0.yytex assets/Textures/texturegroup00_shared_0.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup01_0.yytex assets/Textures/texturegroup02_0.yytex assets/Textures/texturegroup03_0.yytex assets/Textures/texturegroup04_0.yytex assets/Textures/texturegroup05_0.yytex assets/Textures/texturegroup06_0.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup07_0.yytex assets/Textures/texturegroup07_1.yytex assets/Textures/texturegroup07_2.yytex assets/Textures/texturegroup07_3.yytex assets/Textures/texturegroup07_4.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup07_5.yytex assets/Textures/texturegroup07_6.yytex assets/Textures/texturegroup07_7.yytex assets/Textures/texturegroup07_8.yytex assets/Textures/texturegroup07_9.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup07_10.yytex assets/Textures/texturegroup07_11.yytex assets/Textures/texturegroup07_12.yytex assets/Textures/texturegroup07_13.yytex assets/Textures/texturegroup07_14.yytex assets/Textures/texturegroup07_15.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup08_0.yytex assets/Textures/texturegroup09_0.yytex assets/Textures/texturegroup09_1.yytex assets/Textures/texturegroup10_0.yytex assets/Textures/texturegroup11_0.yytex assets/Textures/texturegroup12_0.yytex assets/Textures/texturegroup12_1.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup13_0.yytex assets/Textures/texturegroup14_0.yytex assets/Textures/texturegroup15_0.yytex assets/Textures/texturegroup16_0.yytex assets/Textures/texturegroup17_0.yytex assets/Textures/texturegroup18_0.yytex assets/Textures/texturegroup19_0.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup20_0.yytex assets/Textures/texturegroup21_0.yytex assets/Textures/texturegroup22_0.yytex assets/Textures/texturegroup23_0.yytex assets/Textures/texturegroup24_0.yytex assets/Textures/texturegroup25_0.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup26_0.yytex assets/Textures/texturegroup27_0.yytex assets/Textures/texturegroup28_0.yytex assets/Textures/texturegroup29_0.yytex assets/Textures/texturegroup30_0.yytex assets/Textures/texturegroup31_0.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup32_0.yytex assets/Textures/texturegroup32_1.yytex assets/Textures/texturegroup32_2.yytex assets/Textures/texturegroup32_3.yytex assets/Textures/texturegroup32_4.yytex assets/Textures/texturegroup32_5.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup32_6.yytex assets/Textures/texturegroup32_7.yytex assets/Textures/texturegroup32_8.yytex assets/Textures/texturegroup32_9.yytex assets/Textures/texturegroup32_10.yytex assets/Textures/texturegroup32_11.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup32_12.yytex assets/Textures/texturegroup32_13.yytex assets/Textures/texturegroup32_14.yytex assets/Textures/texturegroup32_15.yytex assets/Textures/texturegroup32_16.yytex assets/Textures/texturegroup32_17.yytex assets/Textures/texturegroup32_18.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup32_19.yytex assets/Textures/texturegroup32_20.yytex assets/Textures/texturegroup32_21.yytex assets/Textures/texturegroup32_22.yytex assets/Textures/texturegroup32_23.yytex assets/Textures/texturegroup32_24.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup33_0.yytex assets/Textures/texturegroup33_1.yytex assets/Textures/texturegroup34_0.yytex assets/Textures/texturegroup35_0.yytex assets/Textures/texturegroup35_1.yytex assets/Textures/texturegroup35_2.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup35_3.yytex assets/Textures/texturegroup35_4.yytex assets/Textures/texturegroup35_5.yytex assets/Textures/texturegroup36_0.yytex assets/Textures/texturegroup37_0.yytex assets/Textures/texturegroup38_0.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup39_0.yytex assets/Textures/texturegroup39_1.yytex assets/Textures/texturegroup39_2.yytex assets/Textures/texturegroup39_3.yytex assets/Textures/texturegroup40_0.yytex assets/Textures/texturegroup41_0.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup41_1.yytex assets/Textures/texturegroup41_2.yytex assets/Textures/texturegroup41_3.yytex assets/Textures/texturegroup41_4.yytex assets/Textures/texturegroup41_5.yytex assets/Textures/texturegroup41_6.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup41_7.yytex assets/Textures/texturegroup42_0.yytex assets/Textures/texturegroup43_0.yytex assets/Textures/texturegroup44_0.yytex assets/Textures/texturegroup45_0.yytex assets/Textures/texturegroup45_1.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/Textures/texturegroup46_0.yytex assets/Textures/texturegroup47_0.yytex assets/Textures/texturegroup48_0.yytex assets/Textures/texturegroup49_0.yytex assets/Textures/texturegroup50_0.yytex assets/Textures/texturegroup51_0.yytex
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/options.ini
./bin/aapt-osx add -f -v UFO50Wrapper.apk assets/game.droid

# Zipalign and sign APK
echo "Building APK..."
./bin/zipalign-osx -p -f -v 4 UFO50Wrapper.apk com.unofficial.ufo50.zipalign.apk
./bin/java/Contents/Home/bin/java -jar ./bin/apksigner.jar sign --key ./base/testkey.pk8 --cert ./base/testkey.x509.pem --out com.unofficial.ufo50.apk com.unofficial.ufo50.zipalign.apk

# Clean up
echo "Cleaning up..."
rm -f ./com.unofficial.ufo50.zipalign.apk
rm -f ./com.unofficial.ufo50.apk.idsig
rm -f ./UFO50Wrapper.apk
rm -rf ./assets

echo "Done! Have fun."
read -n 1 -s -r -p "Press any key to continue..."
echo
