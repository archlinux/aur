# Maintainer: Ioachim Radu <righita@disroot.org>
pkgname=koffe
pkgver=1.4.0
pkgrel=1
epoch=
pkgdesc="simple tool for creating easy to use and offline-friendly arch installers with aur support"
arch=('any')
url="https://github.com/konickss/koffe"
license=('GPL')
groups=()
depends=(bash archiso pacman-contrib libnewt wget git)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/konickss/koffe.git#commit=d4a3354b0dd6b426c517b7c4e88d550d2ddda31c')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
	install -Dm755 ${srcdir}/koffe/koffe ${pkgdir}/usr/bin/koffe
	install -Dm644 ${srcdir}/koffe/install ${pkgdir}/usr/share/koffe/install
	install -Dm644 ${srcdir}/koffe/pi.is ${pkgdir}/usr/share/koffe/pi.is
}
