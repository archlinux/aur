# Maintainer: Cass Spencer <cass.spencer.aur at gmail dot com>

pkgname=pigz-gzip-symlink
pkgver=1
pkgrel=1
pkgdesc="Symlinks gzip to pigz"
arch=('any')
license=('GPL')
depends=('pigz' 'which')
provides=('gzip')
conflicts=('gzip')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    ln -T -s $(which pigz) "${pkgdir}/usr/bin/gzip"
}
