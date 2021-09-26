# Maintainer: Benedikt Heine <benedikt@heine.rocks>
#   - ported to AUR4 from upstream PKGBUILD

pkgname=repo-make
pkgver=3.2.0
pkgrel=1
pkgdesc="Tool for autobuilding a repository full of PKGBUILD's into a working Arch Linux binary repository"
arch=('any')
url="https://github.com/M-Reimer/repo-make"
license=('AGPL3')
depends=('perl')
source=("https://github.com/M-Reimer/repo-make/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('efbfbf96503ff09407e9a3f7a786272e9b329405027e61b0918f267b188df65a')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
