# Maintainer: Geoffrey Frogeye <geoffrey+aur@frogeye.fr>

pkgname=check-sieve
pkgver=0.6
pkgrel=1
pkgdesc="Syntax checker for mail sieves."
arch=('i686' 'x86_64')
url="https://github.com/dburkart/${pkgname}"
license=('custom')
depends=('gcc-libs')
source=("https://github.com/dburkart/check-sieve/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('63345f1bc9afb1e54e335f8a99cdfad4')


build() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	install -Dm755 check-sieve "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

