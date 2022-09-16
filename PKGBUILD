# Maintainer: Cass Spencer <cass.spencer.aur at gmail dot com>

pkgname=pigz-gzip-symlink
pkgver=2.7
pkgrel=2
pkgdesc="Symlinks gzip to pigz"
arch=('any')
license=('GPL')
depends=('pigz')
provides=('gzip')
conflicts=('gzip')
url="https://zlib.net/pigz/"

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    ln -T -s $(which pigz) "${pkgdir}/usr/bin/gzip"
    ln -T -s $(which unpigz) "${pkgdir}/usr/bin/gunzip"
}
