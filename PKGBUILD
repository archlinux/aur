# Maintainer: Peter Taylot <me@et1.uk>
pkgname=big-finish-downloader
pkgver=v1.0.0
pkgrel=1
origver=1.0-beta-2

pkgdesc="A GTK tool to manage your Big Finish Library"
arch=("any")
url="https://github.com/Emersont1/big-finish-downloader"
license=('MIT')
depends=(gtk3 libsecret curl)
makedepends=(cmake gcc)
source=("https://github.com/Emersont1/big-finish-downloader/releases/download/v$origver/bin.tar.gz")

md5sums=('b43161467c8632dcf1f2a84643710a45')
sha256sums=('70160c9a5ac4a31d4f6d88cb82572e87640d6f191fde348e763925b9371d2940')

package() {
    install -Ddm755 $srcdir/bin/ $pkgdir/usr
    install -Ddm644 $srcdir/lib/ $pkgdir/usr
    install -Ddm644 $srcdir/share/ $pkgdir/usr
}
