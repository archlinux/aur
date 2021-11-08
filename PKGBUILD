# Maintainer: zzy-ac <1304024859@qq.com>
pkgname=font-editor
pkgver=1
pkgrel=2
pkgdesc="A Easy Font Editor "
arch=(x86_64)
url="https://github.com/zzy-ac/fonteditor"
license=('GPL')
depends=('electron')
source=("https://github.com/zzy-ac/fonteditor/raw/electron-pkg/font-editor.tar.gz")
md5sums=("619d7d9f0d64575532f61f3580107626")

prepare() {
	mkdir "$pkgname-$pkgver"
	cp -r usr "$pkgname-$pkgver"/usr
}


package() {
	cd "$pkgname-$pkgver"
    cp -r usr ${pkgdir}
}
 
 
