# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=general-preprocessor
pkgver=2.1.2
pkgrel=1
pkgdesc="Bash-based preprocessor for anything"
url="https://codeberg.org/maandree/gpp"
arch=(any)
license=('custom:ISC')
depends=()
optdepends=('bash: default shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(c2b35a73a7597886c6af920c53af2db20d4a2de8be1f0b63ac52c43bb13dd157)


build () {
        cd "${srcdir}/gpp"
        make PREFIX="/usr" DESTDIR="${pkgdir}"
}

package () {
        cd "${srcdir}/gpp"
        make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
