_pkgname=neo4j-community
pkgname=${_pkgname}-bin
pkgver="5.23.0"
pkgrel=1
pkgdesc='A fully transactional graph database implemented in Java (binary package)'
license=('GPL-3.0-only')
arch=('any')
url="https://github.com/neo4j/neo4j"
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://dist.neo4j.org/deb/neo4j_${pkgver}_all.deb")
sha256sums=('8dc6bcfc221a345207d5b98090683dc8d021bf5f57dacf285eb26f006f24c325')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "$pkgdir/lib" "$pkgdir/usr"
}
