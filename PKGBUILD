# Maintainer: Kr1ss <kr1ss.x@yandex.com>

pkgname=lbd
pkgver=0.4
pkgrel=2
pkgdesc='Load Balancer Detector - checks if a given domain uses load balancing'
arch=('any')
url='https://tools.kali.org/information-gathering/lbd'
license=('GPL2')
provides=('lbd')
options=()
source=("$pkgname"
        "${pkgname}.sig")
sha256sums=('2c908eb74a988766c4bb1caa349ebd0ef2aeaf89447bdcb771bbc75b3fd4c0d2'
            'SKIP')
validpgpkeys=('7A194E3F7A8F867BEA8A5339023F078862ACFE50')

package() {
	cd "$srcdir"
	install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
