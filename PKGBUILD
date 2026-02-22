# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=general-preprocessor
pkgver=2.1.4
pkgrel=1
pkgdesc="Bash-based preprocessor for anything"
url="https://codeberg.org/maandree/gpp"
arch=(any)
license=('custom:ISC')
depends=()
optdepends=('bash: default shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(d2a822c79688b2df5c1ff606d273154e6c70130bd667df5d68b6050d30ff240a)


build () {
        cd "${srcdir}/gpp"
        make PREFIX="/usr" DESTDIR="${pkgdir}"
}

package () {
        cd "${srcdir}/gpp"
        make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
