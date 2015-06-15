# INotifyX: Installer: Arch
# Maintainer:  Tom Vincent <http://tlvince.com/contact>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=python2-inotifyx
_pkgname=inotifyx
pkgver=0.2.0
pkgrel=5
pkgdesc="A simple Python binding to the Linux inotify file system event monitoring API"
arch=("i686" "x86_64")
url="http://www.alittletooquiet.net/software/inotifyx/"
license=("MIT")
depends=("python2")
options=(!emptydirs)
provides=(inotifyx)
conflicts=(inotifyx)
source=(http://launchpad.net/${_pkgname}/dev/v${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz)
sha1sums=('e29996f6882227e390464de2185eb25fc4e0c951')

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	# Install
	python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
}
