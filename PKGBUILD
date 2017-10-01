# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=btrfs-snap
pkgver=1.7.3
pkgrel=1
pkgdesc="Creates and maintains the history of snapshots of btrfs filesystems"
license=('GPL3')
depends=('btrfs-progs')
arch=('any')
url="https://github.com/jf647/btrfs-snap"
source=(https://github.com/jf647/btrfs-snap/archive/${pkgver}.tar.gz)
sha256sums=('25b4ae22670e2a05542fd920edc06dc9741b36cce9b3ffe50d7e348837da71e4')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/btrfs-snap" "${pkgdir}/usr/bin/btrfs-snap"
}
