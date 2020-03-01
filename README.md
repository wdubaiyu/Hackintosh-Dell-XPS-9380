# Hackintosh-Dell-XPS-9380
一、系统安装

	1、镜像用的黑果小兵的（10.14.x ~ 10.15.x）https://mirrors.dtops.cc/iso/MacOS/daliansky_macos/
	2、安装参照黑果小兵的教程：https://blog.daliansky.net/Lenovo-Xiaoxin-Air-13-macOS-Mojave-installation-tutorial.html
	3、EFI用我的，不要用黑果小兵镜像里面的，更不要用成Lenovo-Xiaoxin-Air-13得了。
	重要说明
		重点1：硬盘Raid模式无损转换为AHCI模式，参考链接：https://www.dazhuanlan.com/2019/12/15/5df650b549a64/
		重点2：将Secure Boot 改为 Disabled。BIOS里面自己找。这个都找不到就不要装黑苹果了。
		重点3：第二阶段的安装会报错，不要方！！！重启进入系统就行了；
		重点4：把EFI搬运到硬盘，然后执行附件里的  ALCPlugFix⁩ ▸ ⁨alc_fix⁩ ▸install双击自动安装（解决耳机无声）

二、注意事项：

	1、不识别电源适配器（电池没显示充电符号），在mac下插好电源充满，拔掉用掉5%左右（其实掉一点也行），关机重新开。一次不行多来几次，肯定会好的
	2、屏幕上面没有鼠标指针，伸出你高贵的猪脚，在屏幕上面点一下就好了。（我一般点启动台）
	3、我的硬盘INTEL 760P DELL打了马甲，其他硬盘不知道能用不，dsdt放了硬盘补丁。
	4、系统测试通过：
	   1：14.4.4 OS X 14.4.6 推荐使用备份文件：CLOVER 10.14 备份.zip
	   2：10.15.5 仓库EFI
	5、安装完成一定要安装声卡守护程序，不安装耳机用不了。

三、已知问题：

	1、Siri无法使用，一直叫我重说（可能是语言不通吧，手动滑稽）。
	2、内置wifi killer网卡无法使用，9380也换不了，大神可以飞线。外置吧！外置吧！外置吧！
	3、耳麦无法工作（Jack_MIC)。
	4、插入耳机睡眠唤醒耳机不能使用，需要拔插一次。
四、修改记录：


        20200301 移除大量无用文件，减小体积。仓库备份文件 CLOVER 10.14 备份.zip 只能用于10.14.x。
	20200227 更改ec控制器，支持10.15.3（使用仓库EFI文件安装即可）,添加SSDT-EC,SSDT-RTC;更换主题为 Catalina4K。
	20200217 修改config，新增安装文件：http://bbs.pcbeta.com/viewthread-1842031-1-1.html。
	20200213 升级驱动：Lilu.kext AppleALC.kext WhateverGreen.kext。
	20200203 使用SMCBatteryManager.kext、VirtualSMC.kext 解决电池显示问题。
