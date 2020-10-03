# Hackintosh-Dell-XPS-9380

## 硬件配置参考

- 型号：XPS13-9380
- CPU：QuadCore Intel Core i7-8565U, 4500 MHz (45 x 100)
- GPU：Intel UHD Graphics 620
- 内存：16GB 三星颗粒
- 显示器：3840x2160 内置夏普屏型号被DELL打码
- SSD：  ~~SSDPEMKF512G8 NVMe INTEL 512GB (476 GB)~~ **已换sn730 1TB**
- 无线网卡：COMFAST CF-812AC（购于淘宝外接usb，驱动问卖家要）
- 系统：macOS 10.15.5 (19F101)，10.15.6 (19G2021)
- BIOS：[1.8.0](https://www.dell.com/support/home/cn/zh/cnbsd1/product-support/product/xps-13-9380-laptop/drivers)   其实都一样，没必要升级过来，升级了1.8.0 无法回退之前版本 。

## 不工作的硬件、或者工作不完美

​	1、指纹模块不工作

​	2、wifi模块不工作

​	3、蓝牙无法正常关闭，不影响使用

​	4、月亮键(fn+F12)在睡眠被打断后亮度不够，需要再按一下月亮键

​	5、二合一耳机麦克风，耳麦不工作，耳机工作正常

​	6、雷电网3未知

## 系统安装

如果你是新手请完全安装安装教程来操作。
- 一、参考文件

     - 1、[镜像用的黑果小兵的（10.15.X）](https://mirrors.dtops.cc/iso/MacOS/daliansky_macos/)
     - 2、安装参考 参考clover分区的word文档。

- 二、 重要说明&BIOS设置

     - 1、[硬盘Raid模式无损转换为AHCI模式，参考链接](https://www.dazhuanlan.com/2019/12/15/5df650b549a64/)
     - 2、将Secure Boot - Secure Boot Enable 取掉勾选。BIOS里面自己找。这个都找不到就不要装黑苹果了。
     - 3、把EFI搬运到硬盘，然后执行 ⁨alc_fix⁩ 里的 install双击自动安装（解决耳机无声）

- 三、已知问题：

     - 1、内置wifi killer网卡无法使用，9380也换不了，大神可以飞线。外置吧！外置吧！外置吧！
     - 2、耳麦无法工作（Jack_MIC)。
     - 3、~~长时间睡眠换新后，触摸板和触目屏可能无法使用，需要重启电脑~~。

- 四、注意事项

     - 屏幕上面没有鼠标指针，伸出你高贵的猪脚，在屏幕上面点一下就好了。（我一般点启动台）
- 我的硬盘INTEL 760P DELL打了马甲，其他硬盘不知道能用不，~~dsdt放了硬盘补丁~~，已换SN730。
     - 10.15.6 (19G2021)测试通过： 安装完成一定要安装声卡守护程序（⁨alc_fix⁩ 里的 install双击自动安装 ，需要关闭SPI保护），不安装耳机用不了。
- 五、虚拟网卡en0的方法（之前使用本EFI安装的系统 20200709前）
     - 打开 **系统偏好设置** 的 **网络** 。
     - 删除所有网络，如图《清除所有网络》。
     - 删除 `资源库\Preferences\SystemConfiguration\NetworkInterfaces.plist` 文件。
     - 重启。

## 修改记录：
- OpenCore20201003-1100 升级到oc61，移除了三码请自行添加。内置显示器只有48hz待解决。

- OpenCore20200921-1251 更新支持右侧SD卡的支持；修改i2c驱动（触摸板GPIO中断，触摸屏APCI中断）解决了睡眠唤醒后触摸设备无法使用的问题。

- OpenCore20200916-2234  升级到OC6.0 移除SSDT-ADP1.aml ~~修改SSDT-YTBT.aml、SSDT-USBX.aml~~

  ~~预制变量方法驱动i2c设备 SSDT-I2C.aml （如果遇到睡眠唤醒触摸设备不能使用，把SSDT-I2C.aml 里面的0x08换成Zero以禁用触摸屏）~~

- OpenCore202000813-2043 ~~修改SSDT-BRTX提升亮度~~，增加SSDT-RMCF屏蔽FN+s，FN+b ,映射FN+F11为F13在偏好设置里设置为截图，以获得更好体验。

- OpenCore20200709-1421 使用SSDT-LAN.aml 和 NullEthernet.kext 仿冒一个以太网卡，让Siri工作，如果你是之前安装好的系统，请修改BSD名称，保证虚拟网卡是en0。

-	OpenCore20200623-1356 修复睡眠唤醒后需要敲键盘才能亮屏的BUG，尝试修复唤醒触摸板不能使用的问题，~~屏蔽PR15~~。