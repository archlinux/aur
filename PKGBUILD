# Maintainer: Peter Taylot <me@et1.uk>
pkgname=big-finish-downloader
pkgver=v1.0.2
pkgrel=3
origver=1.0.2

pkgdesc="A GTK tool to manage your Big Finish Library"
arch=("any")
url="https://github.com/Emersont1/big-finish-downloader"
license=('MIT')
depends=(gtk3 libsecret curl)
makedepends=(cmake gcc)
source=("https://github.com/Emersont1/big-finish-downloader/releases/download/v$origver/bin.tar.gz")

md5sums=('3a3182b57268cb2ea12ca70d77da738b')
sha256sums=('9931cd367dda519deb51f1e0e7050fba242361ab628ec5fc98fa752750b55d57')

package() {
    install -Ddm755 $srcdir/bin/ $pkgdir/usr
    install -Ddm644 $srcdir/lib/ $pkgdir/usr
    install -Ddm644 $srcdir/share/ $pkgdir/usr
}
