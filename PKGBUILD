pkgname=jverein
pkgver=4.2.3
pkgrel=1
pkgdesc="A club management plugin for jameica."
arch=('any')
url="https://openjverein.github.io/"
license=("GPL")
depends=('java-runtime>=1.5' 'jameica>=2.12' 'hibiscus>=2.12')
makedepends=('unzip')
install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::https://github.com/openjverein/jverein/releases/download/${pkgver}/jverein.${pkgver}.zip")
sha256sums=('91505097a2c507f399d87fd61838458f8d1b0a2df9973f1448e9343a669fea76')

package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}

