# Maintainer: Peter Taylot <me@et1.uk>
pkgname=big-finish-downloader
pkgver=v1.0.0
pkgrel=2
origver=1.0-beta-3

pkgdesc="A GTK tool to manage your Big Finish Library"
arch=("any")
url="https://github.com/Emersont1/big-finish-downloader"
license=('MIT')
depends=(gtk3 libsecret curl)
makedepends=(cmake gcc)
source=("https://github.com/Emersont1/big-finish-downloader/releases/download/v$origver/bin.tar.gz")

md5sums=('SKIP')
sha256sums=('SKIP')

package() {
    install -Ddm755 $srcdir/bin/ $pkgdir/usr
    install -Ddm644 $srcdir/lib/ $pkgdir/usr
    install -Ddm644 $srcdir/share/ $pkgdir/usr
}
