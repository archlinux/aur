# Maintainer: Lukas Pöschl <lukas at smart-ies dot de>

_origname="cuckoo"
pkgname="${_origname}-chrome"
pkgver=1.1
pkgrel=2
pkgdesc="A tool to make managing linux installations on chromebooks easier."
arch=(x86_64)
url="https://github.com/pl-luk/cuckoo"
license=('GPL3')
depends=(python3 python-configobj openssl chromeos-vboot-reference-git)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('b04b67b696fcbec1639ec29589919c248e69d8d7e16da0b16e80571721fbac84')

package() {
	cd ${srcdir}/${_origname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
