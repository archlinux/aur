pkgname=jverein
pkgver=2.8.15
pkgrel=1
pkgdesc="A club management plugin for jameica."
arch=('any')
url="http://www.jverein.de"
license=("GPL")
depends=('java-runtime>=1.5' 'jameica>=2.6' 'hibiscus>=2.6' 'libstdc++5')
makedepends=('unzip')
install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::http://www.jverein.de/updates/2.8/jverein.${pkgver}.zip")
md5sums=('bfeba9855e48890168437f01f67cd510')

package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}

