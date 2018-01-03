pkgname=jverein
pkgver=2.8.16
pkgrel=2
pkgdesc="A club management plugin for jameica."
arch=('any')
url="http://www.jverein.de"
license=("GPL")
depends=('java-runtime>=1.5' 'jameica>=2.6' 'hibiscus>=2.6' 'libstdc++5')
makedepends=('unzip')
install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::https://github.com/$pkgname/$pkgname/archive/${pkgver}.tar.gz")
md5sums=('b958152f44c2f082f3c0f9635d4a98f8')

package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/jameica/plugins"
}

