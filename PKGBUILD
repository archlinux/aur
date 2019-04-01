# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Leo Zacharry <leo.zacharry@gmail.com>
pkgname=miradb
pkgver=1.0.30
pkgrel=1
pkgdesc="cross platform lightweight open source database (oodb) management"
arch=("any")
url="https://miradb.com/docs/"
license=('MIT')
checkdepends=()
optdepends=()
changelog=
install=
source=("https://github.com/Nodeclient/Mira-DB/releases/download/linux/$pkgname-$pkgver.tar.gz")
md5sums=('f14d2f0864097c993d9654b9789fcd42')

package() {
cd $srcdir/$pkgname-$pkgver/ 
mkdir -p  ${pkgdir}/usr/bin/$pkgname/
cp -a   $srcdir/$pkgname-$pkgver/.  ${pkgdir}/usr/bin/$pkgname/
}

