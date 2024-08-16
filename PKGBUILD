# Maintainer: BreakTheMyth <pinks302@163.com>
pkgname=fcitx5-medium5-haiyi
pkgver=1.0
pkgrel=1
pkgdesc="A Medium⁵.Haiyi theme for fcitx5"
arch=('any')
url="https://github.com/BreakTheMyth/fcitx5-medium5-haiyi/"
license=('custom')
makedepends=('tar' 'gzip')
source=("https://github.com/BreakTheMyth/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir"
	tar -zxvf "v$pkgver.tar.gz"
}

package() {
	install -d "$pkgdir/usr/share/fcitx5/themes/"
	cp -r "$srcdir/$pkgname-$pkgver/海伊倒立武功秘籍之大荒囚天指！（？）/" "$pkgdir/usr/share/fcitx5/themes/"
}


