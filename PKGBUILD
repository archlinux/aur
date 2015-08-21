# Maintainer: doragasu: doragasu <yawn> hotmail <roll> com

_basename=vlc-htsp-plugin
pkgname=${_basename}-git
pkgver=r147
pkgrel=1
pkgdesc="The HTSP VLC plugin allows VLC to act as a standalone Tvheadend client."
arch=('i686' 'x86_64')
url="https://github.com/BtbN/vlc-htsp-plugin/"
license=('GPL2')
depends=('vlc')
conflicts=("$_basename")
provides=("$_basename")

source=("git+https://github.com/BtbN/${_basename}.git")
md5sums=('SKIP')

build() {
	# Just build...
	cd "${_basename}"
	make
}

package() {
	# ... and install
	cd "${_basename}"
	DESTDIR=${pkgdir} make install
}

