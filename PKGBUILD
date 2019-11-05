# Maintainer: Simao Gomes Viana <xdevs23@outlook.com>

pkgname=linux-nitrous-headers
pkgver=5.3.8
pkgrel=11
_tar_pkgrel=9
pkgdesc="Headers for linux-nitrous"
arch=('x86_64')
url="https://gitlab.com/xdevs23/linux-nitrous"
license=('GPL2')
groups=()
depends=()
provides=('linux')
conflicts=('linux-nitrous-git-headers')
makedepends=('tar')
source=("https://github.com/xdevs23/linux-nitrous/releases/download/v$pkgver-$_tar_pkgrel/linux-nitrous-git-headers-$pkgver-$_tar_pkgrel-x86_64.pkg.tar.xz")
sha256sums=('6d56228e77c52f8c2f03d85b5d581fb46a825c87c62836f46dcfdb1e3e676d5f')

build() {
    echo "No need to build anything"
}

package() {
    cd "$srcdir"
    tar -xvf "$srcdir"/*.tar.xz -C "$pkgdir"
    for f in .BUILDINFO .INSTALL .MTREE .PKGINFO; do
      rm -f "$pkgdir/$f"
    done
}
