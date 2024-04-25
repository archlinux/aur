# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=bvn-26-beta
pkgver=2.6b1
pkgrel=1
pkgdesc="A Horizontal Version of Fighting Game on Flash"
arch=('x86_64')
url="https://tieba.baidu.com/f?kw=%CB%C0%C9%F1vs%BB%F0%D3%B0"
license=('custom')
depends=('flashplayer-standalone')
source=('https://github.com/Brx86/yun/releases/download/2/bvn-26-beta.tar.gz')
md5sums=('8846c18ffcf5d74ac51f82b6362c751d')
noextract=()

prepare() {
	mkdir "$pkgname-$pkgver"
	cp -r opt "$pkgname-$pkgver"/opt
	cp -r usr "$pkgname-$pkgver"/usr
}

package() {
	cd "$pkgname-$pkgver"
	cp -r opt ${pkgdir}
	cp -r usr ${pkgdir}
}
