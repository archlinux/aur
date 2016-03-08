# INotifyX: Installer: Arch
# Maintainer:  Joost Bremmer <toost dot b at gmail dot com>
# Maintainer:  Tom Vincent <http://tlvince.com/contact>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Maintainer: Solomon Choina <shlomochoina at gmail dot com>
pkgname=python2-inotifyx
pkgver=0.2.2
pkgrel=3
pkgdesc="A simple Python binding to the Linux inotify file system event monitoring API"
arch=("i686" "x86_64")
#url=("http://www.alittletooquiet.net/software/inotifyx/")
license=("MIT")
depends=("python2")
makedepends=("python2-setuptools")
options=(!emptydirs)
provides=(inotifyx)
conflicts=(inotifyx)
source=("http://launchpad.net/${pkgname:8}/dev/v${pkgver}/+download/${pkgname:8}-${pkgver}.tar.gz")
sha256sums=('bad6a84df2a110f282d398dff112b1d3c838a6d50907305121a9af590d185fab')

package() {
	cd ${srcdir}/${pkgname:8}-${pkgver}

	# Install
	python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
