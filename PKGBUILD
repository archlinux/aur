# Maintainer: Chris Trotman <chris@trotman.io>
pkgname=btrfs-du
pkgver=0.0.6
pkgrel=1
pkgdesc="Easily print BTRFS subvolume/snapshot disk usage"
arch=('any')
url="https://github.com/nachoparker/btrfs-du"
license=('GPL3')
depends=("btrfs-progs")
source=("https://github.com/nachoparker/btrfs-du/archive/v$pkgver.tar.gz")
md5sums=("5b61c3f157e2a4aec6e8ce16fdd67e68")

package() {
    cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/bin
    cp btrfs-du $pkgdir/usr/bin/
}
