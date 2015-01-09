# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=lpp
pkgver=0.2.b
pkgrel=1
pkgdesc="LAPACK Plus Plus: C and C++ interface to LAPACK"
arch=(any)
url=http://sourceforge.net/projects/lpp
license=(LGPL2)
makedepends=()
source=("http://sourceforge.net/projects/lpp/files/lpp/lpp-$pkgver/lpp.$pkgver.tgz/download")
sha256sums=('7f0dfaedc371862a8c42d972e28c0e18592a0850755011c6468d67890702bf46')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/include"
    make HEADERDEST="$pkgdir/usr/include"
}
