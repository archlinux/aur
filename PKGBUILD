# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=xnec2c-9m2pju-bin
pkgver=4.4.18.r807.g1caa23d
pkgrel=1
pkgdesc="GTK+ Antenna EM Modeling Client (9M2PJU fork, prebuilt binary)"
arch=('x86_64')
url="https://github.com/9M2PJU/xnec2c"
license=('GPL3')
depends=('gtk3' 'gsl' 'libepoxy')
optdepends=('gnuplot: to use plotted output/data files'
            'openblas: accelerated BLAS/LAPACK linear algebra'
            'lapacke: LAPACK+BLAS support')
provides=('xnec2c')
conflicts=('xnec2c' 'xnec2c-git' 'xnec2c-9m2pju-git')
source=("xnec2c-9m2pju-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}-${pkgrel}/xnec2c-9m2pju-${pkgver}-x86_64.tar.gz")
sha256sums=('0ac4f8de9de71002c00324ce6b8b9d18f5d4bfccd7bdaf8eec40a5be27b4253d')

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir/"
}
