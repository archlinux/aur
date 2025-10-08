pkgname=jverein
pkgver=3.2.0
pkgrel=1
pkgdesc="A club management plugin for jameica."
arch=('any')
url="https://openjverein.github.io/"
license=("GPL")
depends=('java-runtime>=1.5' 'jameica>=2.6' 'hibiscus>=2.6')
makedepends=('unzip')
install=$pkgname.install
#source=("${pkgname}-${pkgver}.zip::https://github.com/$pkgname/$pkgname/archive/${pkgver}.tar.gz")
#source=("${pkgname}-${pkgver}.zip::https://www.jverein.de/updates/2.8/jverein.${pkgver}.zip")
source=("${pkgname}-${pkgver}.zip::https://github.com/openjverein/jverein/releases/download/${pkgver}/jverein.${pkgver}.zip")
sha256sums=('075f6d7b9adaafe33d0afb37a87c9160f280d62b229b08f56a9fd664e388cd13')

package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}

