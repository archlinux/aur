pkgname=zxfer
pkgver=1.1.6
pkgrel=1
pkgdesc="transfer ZFS filesystems, snapshots, properties, files and directories"
arch=('any')
url="https://code.google.com/p/zxfer"
license=('BSD')
depends=('zfs')
source=("https://github.com/allanjude/zxfer/archive/${pkgver}.tar.gz")

package() {
    cd "$srcdir/zxfer-${pkgver}"

    mkdir -p "$pkgdir/usr/share/man/man8/"

    install -D -m755 "zxfer" "$pkgdir/usr/bin/zxfer"
    install -D -m644 "zxfer.8.gz" "$pkgdir/usr/share/man/man8/zxfer.8.gz"
    install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/zxfer/COPYING"
    install -D -m644 "CHANGELOG.txt" "$pkgdir/usr/share/doc/zxfer/CHANGELOG.txt"
}
md5sums=('11b0402782505cd7ee8982ad59297280')
sha1sums=('54145499afab815d126ca8c75a714c308477de4e')
sha256sums=('eb5ef76fedcdbb551ada990e4355fcd4ecb65a0a223c14a2b4ac69e49cf0a974')
