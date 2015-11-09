
# Maintainer: Luca Fulchir <luker at fenrirproject.org>

pkgname=smodels
pkgver=2.34
pkgrel=1
pkgdesc="Implementation of the stable model semantics for logic programs"
arch=('i686' 'x86_64')
url="http://www.tcs.hut.fi/Software/smodels/"
license=('GPL2')
source=(http://www.tcs.hut.fi/Software/smodels/src/${pkgname}-${pkgver}.tar.gz)
sha1sums=('cf3dd5a517afabaa858ccd63ff3e8b38e322f5eb')
sha256sums=('8d14fe02ad2aec636d674c5e1dd6026e8bac5787693fa16425bf6f6fe3959834')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p ${pkgdir}/usr/bin/
    cp smodels ${pkgdir}/usr/bin/
}



