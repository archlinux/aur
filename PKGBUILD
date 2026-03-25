pkgname=jverein
pkgver=4.1.3
pkgrel=1
pkgdesc="A club management plugin for jameica."
arch=('any')
url="https://openjverein.github.io/"
license=("GPL")
depends=('java-runtime>=1.5' 'jameica>=2.12' 'hibiscus>=2.12')
makedepends=('unzip')
install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::https://github.com/openjverein/jverein/releases/download/${pkgver}/jverein.${pkgver}.zip")
sha256sums=('315829d37e93db5f0ca61d83d4b8bcbb766998ebb7fa01d3948a1ca08a077288')

package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}

