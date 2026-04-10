pkgname=jverein
pkgver=4.1.4
pkgrel=1
pkgdesc="A club management plugin for jameica."
arch=('any')
url="https://openjverein.github.io/"
license=("GPL")
depends=('java-runtime>=1.5' 'jameica>=2.12' 'hibiscus>=2.12')
makedepends=('unzip')
install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::https://github.com/openjverein/jverein/releases/download/${pkgver}/jverein.${pkgver}.zip")
sha256sums=('e6a2f71df8e9e52e580902678c524fc3c1f311ffe99d85669d81f0aa22e9672f')

package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}

