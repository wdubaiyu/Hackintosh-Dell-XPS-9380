# Hackintosh-Dell-XPS-9380

## 硬件配置参考

- 型号：XPS13-9380
- CPU：QuadCore Intel Core i7-8565U, 4500 MHz (45 x 100)
- GPU：Intel UHD Graphics 620
- 内存：16GB 三星颗粒
- 显示器：3840x2160 内置夏普屏型号被DELL打码
- SSD：SSDPEMKF512G8 NVMe INTEL 512GB (476 GB)
- 无线网卡：COMFAST CF-812AC（购于淘宝外接usb，驱动问卖家要）
- 系统：macOS 10.14.6 Mojave
- BIOS：1.8.0 (其实都一样，没必要升级过来，升级了1.8.0 无法回退之前版本 )
- [Dell XPS 13 9380 BIOS下载链接](https://www.dell.com/support/home/cn/zh/cnbsd1/product-support/product/xps-13-9380-laptop/drivers)

## 系统安装

- 一、参考文件

     - 1、[镜像用的黑果小兵的（10.14.3 ~ 10.15.x）](https://mirrors.dtops.cc/iso/MacOS/daliansky_macos/)
     - 2、安装参考 仓库中的安装教程 《xps9380 黑苹果安装教程10.15.3.docx》

- 二、 重要说明&BIOS设置

     - 1、 [硬盘Raid模式无损转换为AHCI模式，参考链接](https://www.dazhuanlan.com/2019/12/15/5df650b549a64/)
     - 2、将Secure Boot 改为 Disabled。BIOS里面自己找。这个都找不到就不要装黑苹果了。
     - 3、第二阶段的安装会报错，不要方！！！重启进入系统就行了；
     - 4、把EFI搬运到硬盘，然后执行附件里的  ALCPlugFix⁩ ▸ ⁨alc_fix⁩ ▸install双击自动安装（解决耳机无声）

- 三、已知问题：

     - 1、Siri无法使用，一直叫我重说（可能是语言不通吧，手动滑稽）。
     - 2、内置wifi killer网卡无法使用，9380也换不了，大神可以飞线。外置吧！外置吧！外置吧！
     -  3、耳麦无法工作（Jack_MIC)。
     - 4、插入耳机睡眠唤醒耳机不能使用，需要拔插一次。

- 四、注意事项

     - 不识别电源适配器（电池没显示充电符号），在mac下插好电源充满，拔掉用掉5%左右（其实掉一点也行），关机重新开。一次不行多来几次，肯定会好的
     - 屏幕上面没有鼠标指针，伸出你高贵的猪脚，在屏幕上面点一下就好了。（我一般点启动台）
     - 我的硬盘INTEL 760P DELL打了马甲，其他硬盘不知道能用不，dsdt放了硬盘补丁。
     - 系统测试通过：
       - 1、14.4.4 OS X 14.4.6 推荐使用备份文件：CLOVER 10.14 备份.zip
       - 2、10.15.5 仓库EFI
     - 安装完成一定要安装声卡守护程序，不安装耳机用不了。


## 修改记录：

-	20200306 提供[安装教程](https://github.com/wdubaiyu/Hackintosh-Dell-XPS-9380/blob/master/%E7%B3%BB%E7%BB%9F%E5%AE%89%E8%A3%85%E6%95%99%E7%A8%8B/xps9380%20%E9%BB%91%E8%8B%B9%E6%9E%9C%E5%AE%89%E8%A3%85%E6%95%99%E7%A8%8B10.15.3.docx?raw=true)。
-	20200301 移除大量无用文件，减小体积。仓库备份文件 CLOVER 10.14 备份.zip 只能用于10.14.x。;主题还原Mojave4K。
-	20200227 更改ec控制器，支持10.15.3（使用仓库EFI文件安装即可）,添加SSDT-EC,SSDT-RTC;更换主题为 Catalina4K。
-	20200217 修改config，新增[安装文件](http://bbs.pcbeta.com/viewthread-1842031-1-1.html)。
-	20200213 升级驱动：Lilu.kext AppleALC.kext WhateverGreen.kext。
-	20200203 使用SMCBatteryManager.kext、VirtualSMC.kext 解决电池显示问题。
