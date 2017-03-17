# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=btrfs-snap
pkgver=1.7.2
pkgrel=1
pkgdesc="Creates and maintains the history of snapshots of btrfs filesystems"
license=('GPL3')
depends=('btrfs-progs')
arch=('any')
url="https://github.com/jf647/btrfs-snap"
source=(https://github.com/jf647/btrfs-snap/archive/${pkgver}.tar.gz)
sha256sums=('64d654c817c152919f7ab810e01b516160caa6a6f4679ea8916d87571d46c110')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/btrfs-snap" "${pkgdir}/usr/bin/btrfs-snap"
}
