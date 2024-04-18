# Maintainer: Infernio <infernio at icloud dot com>

pkgname=btrfs-list
pkgver=2.3
pkgrel=1
pkgdesc="Get a nice tree-style view of your btrfs subvolumes/snapshots, including their size, a la 'zfs list'"
arch=('any')
url="https://github.com/speed47/btrfs-list"
license=('GPL2')
depends=('perl' 'btrfs-progs')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/speed47/btrfs-list/archive/v${pkgver}.tar.gz")
sha256sums=('8756e7e013c73d99344fd9a3ee8e9ca72cda5165b6fc2422c280239459c43519')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 btrfs-list "${pkgdir}/usr/bin/btrfs-list"
    install -Dm755 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
