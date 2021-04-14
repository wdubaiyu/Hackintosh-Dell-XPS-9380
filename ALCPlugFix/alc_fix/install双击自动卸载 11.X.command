#!/bin/bash


path=${0%/*}
username=$(whoami)

sudo mount -o nobrowse -t apfs /dev/disk1s5 /Users/$username/Downloads/

sudo launchctl remove /Users/$username/Downloads/Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo rm -rf /Users/$username/Downloads/Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo rm -rf /Users/$username/Downloads/usr/bin/ALCPlugFix

echo '卸载ALCPlugFix守护进程完成！'
echo '重建缓存中，请稍候……'
sudo rm -rf /Users/$username/Downloads/System/Library/Caches/com.apple.kext.caches/Startup/kernelcache
sudo rm -rf /Users/$username/Downloads/System/Library/PrelinkedKernels/prelinkedkernel
sudo touch /Users/$username/Downloads/System/Library/Extensions/ && sudo kextcache -u /
sudo bless --folder /Users/$username/Downloads/System/Library/CoreServices --bootefi --create-snapshot
echo '安装程序结束，请重启电脑！！！'
bash read -p '按任何键退出'