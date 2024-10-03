# Maintainer: Lukas Pöschl <lukas at smart-ies dot de>

_origname="cuckoo"
pkgname="${_origname}-chrome"
pkgver=1.4
pkgrel=1
pkgdesc="A tool to make managing linux installations on chromebooks easier."
arch=(x86_64)
url="https://github.com/pl-luk/cuckoo"
license=('GPL3')
depends=(python3 python-configobj openssl vboot-utils)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('646f10b69ecc558acf73a17e4a7a0f3287c4682547b2b76fe680e14a77233899')

package() {
	cd ${srcdir}/${_origname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
