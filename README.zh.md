# ArchLinux UEFI SecureBoot脚本

语言: [English](README.md) | 中文

## 安装

### 从代码构建包

1. 先从GitHub克隆此仓库

```bash
git clone https://github.com/BigfootACA/secureboot-utils
cd secureboot-utils
```

​	或者从码云克隆
```bash
git clone https://gitee.com/ClassFun/secureboot-utils
cd secureboot-utils
```

2. 运行makepkg
```bash
makepkg
```
构建成功后会生成一个ArchLinux的软件包

3. 使用pacman安装该软件包

```bash
pacman -U secureboot-utils-1.1-1-any.pkg.tar.xz
```

### 从AUR安装

使用yaourt:

```bash
yaourt -S secureboot-utils
```

使用yay:

```bash
yay -S secureboot-utils
```

## 使用方法

### 第一次使用

1. 首先你必须你的电脑支持UEFI
```bash
ls /sys/firmware/efi
```
​	或者从BIOS中查看。

2. 然后确认你的电脑支持SecureBoot
```bash
ls /sys/firmware/efi/efivars/SecureBoot-*
```
​	或者从BIOS中查看。

3. 从BIOS将SecureBoot的模式调整为自定义(custom)模式以准备导入生成的公钥
4. 生成公钥和私钥，并写入固件系统
```bash
secureboot-keygen
```

现在已经对SecureBoot进行初始化，但是在启用SecureBoot之前还需要对内核或者引导加载器进行签名，请查看以下的相关内容。

### 重新将公钥写入固件系统

如果需要重新将公钥重新写入系统，请执行以下命令：
```bash
secure-write
```

### 对内核进行签名

```bash
secureboot-sign --replace /boot/vmlinuz-linux
```

该软件包带有对ArchLinux的标准内核包[linux](https://www.archlinux.org/packages/core/x86_64/linux/)和[linux-lts](https://www.archlinux.org/packages/core/x86_64/linux-lts/)的安装钩子，重新安装内核或者升级内核时会自动对内核重新签名，以保证内核升级重启后能正常使用。

### 对systemd-boot进行签名

```bash
secureboot-sign --systemd-boot
bootctl install
```

该软件包带有对ArchLinux的[systemd](https://www.archlinux.org/packages/core/x86_64/systemd/)的安装钩子，重新安装内核或者升级systemd时会自动对systemd-boot重新签名，以保证重启后能正常使用。

### 对GRUB2进行签名

```bash
secureboot-sign --replace /boot/efi/EFI/boot/bootx64.efi
secureboot-sign --replace /boot/efi/EFI/arch/grubx64.efi
```
