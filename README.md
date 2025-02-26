# UFO50AndroidUnofficial
A tool to build your own Android version of UFO 50

Love UFO 50? Own an Android device and a controller? Then you can enjoy UFO 50 on the go!
It's an extremely simple process to build your own copy and get it running.
Please do not share your APK with others. Mossmouth created an incredible game and
pirating it would be a serious dick move. Don't screw over indie developers.

Currently, up to version 1.6.2.4 is supported. Newer versions of the game may or may not work.

## Building
1. [Purchase UFO 50](https://store.steampowered.com/app/1147860/UFO_50/). The devs deserve the money.
1. Copy your UFO 50 game files into the ufo50 folder.
2. Run build_windows.bat if you're using Windows, build_unix if you're not.
3. Copy com.unofficial.ufo50.apk to your device.
4. Enable installing from unofficial sources on your device, if needed. This will vary from device to device.
5. Install com.unofficial.ufo50.apk with your file manager of choice. You can delete it after it's installed.
6. Play! You can press Start, go to Settings > Video Settings, and set SCALE to FILL to fill the entire screen.

## Save Management
### Prerequisites
- Developer Options must be enabled and USB or Wi-Fi debugging must be allowed on your device.
- UFO 50 must have a save on your device. This means you must have started the game at least once before you attempt to upload your saves.

### Backup (Android -> Computer)
Run one of the following scripts to copy your save files from your device and into the save folder.
- Windows: run `backup_saves_windows.bat`
- Linux: run `backup_saves_linux`

### Restoration (Computer -> Android)
To restore your save, place your save files into the save folder and run one of the following scripts
- Windows: run `upload_saves_windows.bat`
- Linux: run `upload_saves_linux`

## Notes
If you have UFO 50 working on PortMaster, open ufo50.port in an archive manager like 7-zip and use the game.droid and options.ini files in that directory.
If you don't have any idea what the above means, don't worry about it. It's entirely optional.

## To-Do
- Integrate PortMaster's changes into build script as an optional selection
- Implement touch controls (may never happen, need to research injecting objects using UndertaleModTool
