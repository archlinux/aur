# Maintainer: Sakura1943 <1436700265@qq.com>
pkgname=com.officebox.deepin
pkgver=3.0.7
pkgrel=1
pkgdesc="万彩办公大师Office Box是一款免费办公工具箱，小小工具箱，几乎满足各种办公需求，包含70+个无任何广告及插件的办公小工具，所有的小工具无需安装，直接加载启动，从此省去到处寻找工具、安装及卸载的麻烦。"
arch=(x86_64)
url="http://http://www.wofficebox.com/"
license=('GPL')
depends=('deepin-wine5' 'deepin-wine5-helper')
provides=(officebox=$pkgver)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/Sakura1943/officebox/-/raw/master/com.officebox.deepin.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
	mkdir "$pkgname-$pkgver"
	cp -r opt "$pkgname-$pkgver"/opt
	cp -r usr "$pkgname-$pkgver"/usr
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}


package() {
	cd "$pkgname-$pkgver"
    cp -r opt ${pkgdir}
    cp -r usr ${pkgdir}
}
