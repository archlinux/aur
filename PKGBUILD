# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=xnec2c-9m2pju-bin
pkgver=4.4.18.r807.g1caa23d
pkgrel=1
pkgdesc="GTK+ Antenna EM Modeling Client (9M2PJU fork, prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/xnec2c"
license=('GPL3')
depends=('gtk3' 'gsl' 'libepoxy')
optdepends=('gnuplot: to use plotted output/data files'
            'openblas: accelerated BLAS/LAPACK linear algebra'
            'lapacke: LAPACK+BLAS support')
provides=('xnec2c')
conflicts=('xnec2c' 'xnec2c-git' 'xnec2c-9m2pju-git')
source_x86_64=("xnec2c-9m2pju-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}-${pkgrel}/xnec2c-9m2pju-${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('0ac4f8de9de71002c00324ce6b8b9d18f5d4bfccd7bdaf8eec40a5be27b4253d')
source_aarch64=("xnec2c-9m2pju-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}-${pkgrel}/xnec2c-9m2pju-${pkgver}-aarch64.tar.gz")
sha256sums_aarch64=('d773073bef1a731bc359896951d0e936cfa1ac16ef9f96c346a1fc2682fddba2')

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir/"
}
