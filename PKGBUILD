# Maintainer  : Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Chris Trotman <chris@trotman.io>

pkgname=btrfs-du
pkgver=0.0.7
pkgrel=1
pkgdesc="Easily print BTRFS subvolume/snapshot disk usage"
arch=('any')
url="https://github.com/nachoparker/$pkgname"
license=('GPL3')
depends=("btrfs-progs")
source=("https://github.com/nachoparker/btrfs-du/archive/v$pkgver.tar.gz")
md5sums=('fccfd2c165eb6af6f9694bb39959f2e7')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
