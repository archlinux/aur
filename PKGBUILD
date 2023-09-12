# Maintainer: Lukas Pöschl <lukas at smart-ies dot de>

_origname="cuckoo"
pkgname="${_origname}-chrome"
pkgver=1.0
pkgrel=1
pkgdesc="A tool to make managing linux installations on chromebooks easier."
arch=(x86_64)
url="https://github.com/pl-luk/cuckoo"
license=('GPL3')
depends=(python3 python-configobj openssl chromeos-vboot-reference-git)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('0a0bc1770d78332ab24f5322db063adfa531f4445b2db4f3de637c199c4f12ff')

package() {
	cd ${srcdir}/${_origname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
