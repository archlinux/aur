# Maintainer: Michael 'm1ckey' Krickl <ch.michael.krickl@gmail.com>

pkgname=c-macro
pkgver=1.0.10
pkgrel=1
pkgdesc='The C Macro makes your local clipboard easily accessible in your Terminal'
arch=('any')
url='https://github.com/rettier/c'
license=('MIT')
depends=(bash xclip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rettier/c/releases/download/v$pkgver/c_$pkgver.tar.gz")
sha256sums=('5846a581c096c74315a49f9179677da1aeb81e4e4fbb423dafd8619866208eb8')

package() {
	cd "$srcdir/c_$pkgver"
	install -Dm 755 c "$pkgdir/usr/bin/c"
	ln -s ./c "$pkgdir/usr/bin/cf"
}
