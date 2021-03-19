#!/bin/bash


path=${0%/*}
username=$(whoami)

sudo mount -o nobrowse -t apfs /dev/disk1s5 /Users/$username/Downloads/

sudo cp -a "$path/ALCPlugFix" /Users/$username/Downloads/usr/bin
sudo chmod 755 /Users/$username/Downloads/usr/bin/ALCPlugFix
sudo chown root:wheel /Users/$username/Downloads/usr/bin/ALCPlugFix
sudo cp -a "$path/hda-verb" /Users/$username/Downloads/usr/bin
sudo chmod 755 /Users/$username/Downloads/usr/bin/hda-verb
sudo chown root:wheel /Users/$username/Downloads/usr/bin/hda-verb
sudo cp -a "$path/good.win.ALCPlugFix.plist" /Users/$username/Downloads/Library/LaunchAgents/
sudo chmod 644 /Users/$username/Downloads/Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo chown root:wheel /Users/$username/Downloads/Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo launchctl load /Users/$username/Downloads/Library/LaunchAgents/good.win.ALCPlugFix.plist
echo '安装ALCPlugFix守护进程完成！'
echo '重建缓存中，请稍候……'
sudo rm -rf /Users/$username/Downloads/System/Library/Caches/com.apple.kext.caches/Startup/kernelcache
sudo rm -rf /Users/$username/Downloads/System/Library/PrelinkedKernels/prelinkedkernel
sudo touch /Users/$username/Downloads/System/Library/Extensions/ && sudo kextcache -u /

sudo bless --folder /Users/$username/Downloads/System/Library/CoreServices --bootefi --create-snapshot
echo '安装程序结束，请重启电脑！！！'
bash read -p '按任何键退出'