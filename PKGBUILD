# Contributor: Nathan Owe. <ndowens04+AUR@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Mike Sampson <mike@sambodata.com>

pkgname=psgrep
pkgver=1.0.9
pkgrel=1
pkgdesc="Process list search thru grep"
arch=('i686' 'x86_64')
url="https://github.com/jvz/psgrep"
license=('GPL3')
_commit=ae7a6f17397f79bd25b77da1be74792039ea8991
source=(https://github.com/jvz/${pkgname}/archive/${_commit}.zip)
sha256sums=('9c782bab742a21018ea141fb6b5b9b812a0cb84de59bd67efff7493a8127e15c')

package() {
	depends=('which')
	cd ${srcdir}/${pkgname}-${_commit}
	install -Dm755 psgrep ${pkgdir}/usr/bin/psgrep
	install -Dm644 psgrep.1 ${pkgdir}/usr/share/man/man1/psgrep.1
}
