pkgname=jverein
pkgver=2.8.10
pkgrel=1
pkgdesc="A club management plugin for jameica."
arch=('i686' 'x86_64')
url="http://www.jverein.de"
license=("GPL")
depends=('java-runtime>=1.5' 'jameica>=2.6' 'hibiscus>=2.6' 'libstdc++5')
makedepends=('unzip')
install=jverein.install
source=("${pkgname}-${pkgver}.zip::http://www.jverein.de/updates/2.8/jverein.${pkgver}.zip")
md5sums=('93d00b982cc0db968a45ef2955bab98f')

package() {
  mkdir -p "$pkgdir/opt/jameica/plugins"

  cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}

