# 在ArchLinux上运行企业微信  

移植Deepin企业微信容器到Arch,不依赖deepin-wine。替换企业微信版本为最新版本
#### 安装
- AUR安装
- 下载安装
- 本地打包安装
#### 常见问题

## 安装

### 从AUR安装
> yay -Sy deepin-wine-wechat

### 下载安装
Release [下载](https://github.com/St-kai/deepin-wine-wxwork-arch/releases) 

> pacman -U [wechat work patch]
### 本地打包安装
> git clone https://github.com/St-kai/deepin-wine-wxwork-arch.git  
cd deepin-wine-wxwork-arch
makepkg -Si

### 常见问题
- 插件无法使用
- 无法视频会议