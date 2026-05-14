# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=50
pkgrel=2
epoch=1
pkgdesc='Disable the start up overview in Gnome 40+'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL-3.0-only')
depends=(gnome-shell)
makedepends=(git)
_commit='9d301e7c5a9657b68c9a584aa287f72795d0563b'
source=("git+https://github.com/fthx/no-overview.git#commit=${_commit}")
sha256sums=('0de9cc4decee4b2b1174fd0c738ff8695d654270751a7439ecf6ce71b03cf0f8')

package() {
	cd no-overview
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
