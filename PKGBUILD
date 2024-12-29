# Maintainer: Infernio <infernio at icloud dot com>

pkgname=btrfs-list
pkgver=2.4
pkgrel=1
pkgdesc="Get a nice tree-style view of your btrfs subvolumes/snapshots, including their size, a la 'zfs list'"
arch=('any')
url="https://github.com/speed47/btrfs-list"
license=('GPL2')
depends=('perl' 'btrfs-progs')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/speed47/btrfs-list/archive/v${pkgver}.tar.gz")
sha256sums=('498045736137998918639e500bbd41e1e0ee9dc9c718c35c5fd2d5d73f0e12db')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 btrfs-list "${pkgdir}/usr/bin/btrfs-list"
    install -Dm755 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
