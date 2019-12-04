# Maintainer: Michael 'm1ckey' Krickl <ch.michael.krickl@gmail.com>

pkgname=c-macro
pkgver=1.0.9
pkgrel=1
pkgdesc='The C Macro makes your local clipboard easily accessible in your Terminal'
arch=('any')
url='https://github.com/rettier/c'
license=('MIT')
depends=(bash xclip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rettier/c/releases/download/v$pkgver/c_$pkgver.tar.gz")
sha256sums=('2f7f3dee638fd0047ee6efb59f7002a74f8b29b6adc6e07e02b4962f3465c21a')

package() {
	cd "$srcdir/c_$pkgver"
	install -Dm 755 c "$pkgdir/usr/bin/c"
	ln -s ./c "$pkgdir/usr/bin/cf"
}
