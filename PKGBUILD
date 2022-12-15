# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=arch-chroot-build
pkgdesc="Build AUR packages in a chroot easily"
url='https://github.com/magnus-ISU/aur-scripts/blob/master/arch-chroot-build'
source=('https://raw.githubusercontent.com/magnus-ISU/aur-scripts/master/arch-chroot-build')
pkgver=1
pkgrel=1
license=('MIT')
depends=('devtools')
arch=('any')
sha256sums=('SKIP')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -D -m755 "$srcdir/arch-chroot-build" "${pkgdir}/usr/bin/"
}
