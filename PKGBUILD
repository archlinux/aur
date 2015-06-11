pkgname=zxfer
pkgver=0.9.9
pkgrel=1
pkgdesc="transfer ZFS filesystems, snapshots, properties, files and directories"
arch=('any')
url="https://code.google.com/p/zxfer"
license=('BSD')
depends=('zfs')
source=("https://zxfer.googlecode.com/files/zxfer-${pkgver}.tar.bz2")
md5sums=('3a2a52de6ac4a8b1565d875ccde90f2d')

package() {
    cd "$srcdir/zxfer-${pkgver}"

    mkdir -p "$pkgdir/usr/share/man/man8/"

    install -D -m755 "zxfer" "$pkgdir/usr/bin/zxfer"
    install -D -m644 "zxfer.8.gz" "$pkgdir/usr/share/man/man8/zxfer.8.gz"
    install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/zxfer/COPYING"
    install -D -m644 "CHANGELOG.txt" "$pkgdir/usr/share/doc/zxfer/CHANGELOG.txt"
}
