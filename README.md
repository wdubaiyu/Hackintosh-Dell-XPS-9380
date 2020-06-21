# Hackintosh-Dell-XPS-9380

## 硬件配置参考

- 型号：XPS13-9380
- CPU：QuadCore Intel Core i7-8565U, 4500 MHz (45 x 100)
- GPU：Intel UHD Graphics 620
- 内存：16GB 三星颗粒
- 显示器：3840x2160 内置夏普屏型号被DELL打码
- SSD：SSDPEMKF512G8 NVMe INTEL 512GB (476 GB)
- 无线网卡：COMFAST CF-812AC（购于淘宝外接usb，驱动问卖家要）
- 系统：macOS 10.15.5 (19F101)
- BIOS：[1.8.0](https://www.dell.com/support/home/cn/zh/cnbsd1/product-support/product/xps-13-9380-laptop/drivers)   其实都一样，没必要升级过来，升级了1.8.0 无法回退之前版本 。

## 系统安装
如果你是新手请完全安装安装教程来操作。
- 一、参考文件

     - 1、[镜像用的黑果小兵的（10.15.5 (19F101)）](https://mirrors.dtops.cc/iso/MacOS/daliansky_macos/)
     - 2、安装参考 参考clover分区的word文档。

- 二、 重要说明&BIOS设置

     - 1、 [硬盘Raid模式无损转换为AHCI模式，参考链接](https://www.dazhuanlan.com/2019/12/15/5df650b549a64/)
     - 2、将Secure Boot - Secure Boot Enable 取掉勾选。BIOS里面自己找。这个都找不到就不要装黑苹果了。
     - 3、把EFI搬运到硬盘，然后执行 ⁨alc_fix⁩ 里的 install双击自动安装（解决耳机无声）

- 三、已知问题：

     - 1、内置wifi killer网卡无法使用，9380也换不了，大神可以飞线。外置吧！外置吧！外置吧！
     - 2、耳麦无法工作（Jack_MIC)。
     - 3、长时间睡眠换新后，触摸板和触目屏可能无法使用，需要重启电脑。

- 四、注意事项

     - 屏幕上面没有鼠标指针，伸出你高贵的猪脚，在屏幕上面点一下就好了。（我一般点启动台）
     - 我的硬盘INTEL 760P DELL打了马甲，其他硬盘不知道能用不，dsdt放了硬盘补丁。
     - 系统测试通过： 
     - 安装完成一定要安装声卡守护程序（⁨alc_fix⁩ 里的 install双击自动安装 ，需要关闭SPI保护），不安装耳机用不了。


## 修改记录：
-	OpenCore20200621-2300 BUG见正文。
