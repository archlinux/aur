# Maintainer: Lukas Pöschl <lukas at smart-ies dot de>

_origname="cuckoo"
pkgname="${_origname}-chrome"
pkgver=1.2
pkgrel=1
pkgdesc="A tool to make managing linux installations on chromebooks easier."
arch=(x86_64)
url="https://github.com/pl-luk/cuckoo"
license=('GPL3')
depends=(python3 python-configobj openssl vboot-utils)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('264d3b2f56ce02b3853cdcec8f23bf5cf5b4d4b00238c17b52a4be9c8fd334ec')

package() {
	cd ${srcdir}/${_origname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
