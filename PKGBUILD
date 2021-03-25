# Maintainer 5amu <v.casalino@protonmail.com>

pkgname=apkast
pkgver=1.0
pkgrel=0
pkgdesc="Parse and analyse APK files"
url="https://gitlab.com/brn1337/apkast"
license=('GPLv3')
arch=('any')
depends=('jq' 'bc' 'unzip')
makedepends=('make')
source=("https://gitlab.com/brn1337/apkast/-/archive/1.0/apkast-1.0.tar.gz")
sha256sums=("0efd73ce09120f3f9627629329d8b6d1643fef7fcdf532303a16ea93f7947550")

package() {
    cd $srcdir/$pkgname-$pkgver
    make INSTPREFIX=$pkgdir/usr LICENSEDIR=$pkgdir/usr/share/licenses DOCSDIR=$pkgdir/usr/share/doc install
}
