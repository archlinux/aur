# Maintainer 5amu <v.casalino@protonmail.com>

pkgname=apkast
pkgver=2.0
pkgrel=1
pkgdesc="Parse and analyse APK files"
url="https://gitlab.com/brn1337/apkast"
license=('GPLv3')
arch=('any')
depends=('jq' 'bc' 'unzip' 'jadx')
makedepends=('make')
source=("https://gitlab.com/brn1337/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("SKIP")

package() {
    cd $srcdir/$pkgname-$pkgver
    make INSTPREFIX=$pkgdir/usr LICENSEDIR=$pkgdir/usr/share/licenses DOCSDIR=$pkgdir/usr/share/doc install
}
