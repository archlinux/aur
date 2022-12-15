# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=arch-chroot-build
pkgver=1
pkgrel=1
pkgdesc="Build AUR packages in a chroot easily"
arch=('i686' 'x86_64')
license=('MIT')
depends=('devtools')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -D -m755 ../arch-chroot-build "${pkgdir}/usr/bin/"
}
