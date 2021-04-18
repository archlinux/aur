# Maintainer: xmengnet <794508986@qq.com>
pkgname=aria2-config-script
pkgver=0.1
pkgrel=1
pkgdesc="一个自动配置Aria2的脚本，自动创建、启动服务，可直接搭配浏览器插件使用。"
arch=(any)
license=('GPL')
depends=('aria2'
		  'sudo')

source=("https://pan.xmengnet.cn/Aliyun/aur/aria2-config-script/$pkgver/aria2-install.sh"
        "https://pan.xmengnet.cn/Aliyun/aur/aria2-config-script/$pkgver/aria2c.service")
md5sums=('0f49112b1bb2821895166012486b91d9'
		  '3e72d1034ab27b3452f551dbd0f46da0')
validpgpkeys=()


package() {
	chmod +x ./aria2-install.sh
	sh ./aria2-install.sh
}
