# Maintainer:  Joost Bremmer <toost dot b at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=inotifyx
pkgver=0.2.2
pkgrel=1
pkgdesc="A simple Python binding to the Linux inotify file system event monitoring API"
arch=('i686' 'x86_64')
url=("http://www.alittletooquiet.net/software/inotifyx/")
license=("MIT")
depends=("python2")
makedepends=("python2-setuptools")
options=(!emptydirs)
source=(http://launchpad.net/${pkgname}/dev/v${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
sha256sums=('bad6a84df2a110f282d398dff112b1d3c838a6d50907305121a9af590d185fab')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# Install
	python2 setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
#vim: set ts=2 sw=2 et:
