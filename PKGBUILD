pkgname=jverein
pkgver=2.8.17
pkgrel=3
pkgdesc="A club management plugin for jameica."
arch=('any')
url="http://www.jverein.de"
license=("GPL")
depends=('java-runtime>=1.5' 'jameica>=2.6' 'hibiscus>=2.6' 'libstdc++5')
makedepends=('unzip')
install=$pkgname.install
#source=("${pkgname}-${pkgver}.zip::https://github.com/$pkgname/$pkgname/archive/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.zip::http://www.jverein.de/updates/2.8/jverein.${pkgver}.zip")
md5sums=('f26785467d8a48fc9b247c39add2fef8')

package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}

