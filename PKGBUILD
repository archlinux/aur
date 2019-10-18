pkgname=jverein
pkgver=2.8.18
pkgrel=1
pkgdesc="A club management plugin for jameica."
arch=('any')
url="http://www.jverein.de"
license=("GPL")
depends=('java-runtime>=1.5' 'jameica>=2.6' 'hibiscus>=2.6' 'libstdc++5')
makedepends=('unzip')
install=$pkgname.install
#source=("${pkgname}-${pkgver}.zip::https://github.com/$pkgname/$pkgname/archive/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.zip::https://www.jverein.de/updates/2.8/jverein.${pkgver}.zip")
md5sums=('7275a99c6d3970343388c0bee9504dbc')

package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}

