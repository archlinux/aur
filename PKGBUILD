# Maintainer: Filip Borkiewicz <boreq 0x46 net>

pkgname=clcal
pkgver=0.20.1
pkgrel=1
pkgdesc='a calendar program for tracking appointments'
arch=('x86_64')
url='https://github.com/boreq/clcal'
license=('GPL2')
makedepends=('git')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/boreq/clcal/archive/v0.20.1.tar.gz")
sha512sums=('5996d04740fa2d98a3455ba4714c779e38fdb07821a85213458604ea3630e5eaf6c8fe9b698766dfb01b4139afeaf967f1579d974d672d9732dc897d8baab38c')

build() {
	cd "${pkgname}-${pkgver}"

	make
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 clcal "${pkgdir}"/usr/bin/clcal
}
