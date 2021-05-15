# Hackintosh-Dell-XPS-9380

## 硬件配置参考

- 型号：XPS13-9380
- CPU：QuadCore Intel Core i7-8565U, 4500 MHz (45 x 100)
- GPU：Intel UHD Graphics 620
- 内存：16GB 三星颗粒
- 显示器：3840x2160 内置夏普屏型号被DELL打码
- SSD：  ~~SSDPEMKF512G8 NVMe INTEL 512GB (476 GB)~~ **已换sn730 1TB**
- 无线网卡：~~killer1435~~ **硬改苹果网卡934602CS**
- 系统：macOS 10.15.5 (19F101)，10.15.6 (19G2021)，BigSur11.2.3 (20D91)
- BIOS：[1.8.0](https://www.dell.com/support/home/cn/zh/cnbsd1/product-support/product/xps-13-9380-laptop/drivers)   其实都一样，没必要升级过来，升级了1.8.0 无法回退之前版本 。

## 不工作的硬件、或者工作不完美

​	1、指纹模块不工作，无解需要硬改。过保后再说。

​	2、~~killer1435 wifi模块不工作~~，**已经硬改苹果原装网卡934602CS**。

​	3、~~蓝牙无法正常关闭~~，**已经硬改苹果原装网卡934602CS**。

​	4、月亮键(fn+F12)在睡眠被打断后亮度不够，需要再按一下月亮键。

​	5、二合一耳机麦克风，耳麦不工作，耳机工作正常。

​	6、雷电网3未知。

## 系统安装

如果你是新手请完全安装安装教程来操作。
- 一、参考文件

     - 1、[镜像用的黑果小兵的镜像](https://mirrors.dtops.cc/iso/MacOS/daliansky_macos/)
     - 2、安装参考 参考clover分区的word文档，以及百度Google等。
- 二、 重要说明&BIOS设置

     - 1、[硬盘Raid模式无损转换为AHCI模式，参考链接](https://www.dazhuanlan.com/2019/12/15/5df650b549a64/)
     - 2、将**Secure Boot -- Secure Boot Enable** 取掉勾选。
     - 3、将**System Configuration--Thunderbolt Auto Switch** 取掉勾选
     - 4、安装完成后。把EFI搬运到硬盘（或者直接放在硬盘镜像安装都行）
     - 5、关闭Sip（**csrutil disable**）后执行（bigsur 把这个也关闭了**csrutil authenticated-root disable**） ⁨alc_fix⁩ 里的 install双击自动安装解决耳机无声（根据文件名选择执行文件）
- 三、已知问题：

     - 1、内置wifi killer网卡无法使用，已飞线解决。不想飞线的**外置吧！外置吧！外置吧**！
     - 2、耳麦无法工作（Jack_MIC)。
     - 3、~~长时间睡眠换新后，触摸板和触目屏可能无法使用，需要重启电脑~~。
- 四、注意事项

     - ~~屏幕上面没有鼠标指针，伸出你高贵的猪脚，在屏幕上面点一下就好了。（我一般点启动台）~~
- 菜单栏的SD卡图标不要点里面的关闭，会重启。
     - 10.15.6,10.15.7,11.0.1-11.2.3测试通过： 安装完成一定要安装声卡守护程序（⁨alc_fix⁩ 里的 install双击自动安装 根据版本自行选择双击文件，需要关闭SPI保护），不安装耳机无声用不了。
- 五、执行虚拟有线网卡en0的方法已使siri工作，我已经换了wifi网卡EFI不在内置虚拟有线网卡，请参考：OpenCore20200709-1421。

## 修改记录：
- OpenCore20210615-1207 升级OC69以及其他kext驱动。

- OpenCore20210414-1036 升级OC68以及其他kext驱动。

- OpenCore20210310-1733 升级OC67以及其他kext驱动。在BigSur11.2.3 (20D91)上测试正常使用，因为我已经全盘格式化安装mac了，以后可能不测试Windows是否正常。

- OpenCore20210208-1414 升级OC66以及其他kext驱动。由于我硬改应该了wifi网卡，于是移除了lan网卡仿冒，若需要使用Siri请自行仿冒lan网卡。经过测试支持 BIgSur11.2。

- OpenCore20201223-2000 升级i2c驱动，下载链接没更新。官方说有bug，但是我没有遇到，只更新了源码这边。 

- OpenCore20201221-2213 升级到OC64,请**自行替换三码**。支持bigsur，显示器48hz目前不知道怎么解决，我看大多数4k显示器都这样等待大神解决；偶发性开机亮度很低（我只遇到一次），重启故障消失未仔细分析暂时不考虑修复。

- OpenCore20201006-1116 升级到OC62,修改ig-platform-id 为09009B3E  解决内置显示器48hz问题。

- OpenCore20201003-1100 升级到OC61，移除了三码请自行添加。内置显示器只有48hz待解决。

- OpenCore20200921-1251 更新支持右侧SD卡的支持；修改i2c驱动（触摸板GPIO中断，触摸屏APCI中断）解决了睡眠唤醒后触摸设备无法使用的问题。

- OpenCore20200916-2234  升级到OC6.0 移除SSDT-ADP1.aml ~~修改SSDT-YTBT.aml、SSDT-USBX.aml~~

  ~~预制变量方法驱动i2c设备 SSDT-I2C.aml （如果遇到睡眠唤醒触摸设备不能使用，把SSDT-I2C.aml 里面的0x08换成Zero以禁用触摸屏）~~

- OpenCore202000813-2043 ~~修改SSDT-BRTX提升亮度~~，增加SSDT-RMCF屏蔽FN+s，FN+b ,映射FN+F11为F13在偏好设置里设置为截图，以获得更好体验。

- OpenCore20200709-1421 使用SSDT-LAN.aml 和 NullEthernet.kext 仿冒一个以太网卡，让Siri工作，如果你是之前安装好的系统，请修改BSD名称，保证虚拟网卡是en0。

-	OpenCore20200623-1356 修复睡眠唤醒后需要敲键盘才能亮屏的BUG，尝试修复唤醒触摸板不能使用的问题，~~屏蔽PR15~~。