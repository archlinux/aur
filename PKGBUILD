# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=general-preprocessor
pkgver=2.1.3
pkgrel=1
pkgdesc="Bash-based preprocessor for anything"
url="https://codeberg.org/maandree/gpp"
arch=(any)
license=('custom:ISC')
depends=()
optdepends=('bash: default shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(c07d4495b344d6723cd6219f70f77110f07a0e92f0b78e9ce4ca0887fbb6fb83)


build () {
        cd "${srcdir}/gpp"
        make PREFIX="/usr" DESTDIR="${pkgdir}"
}

package () {
        cd "${srcdir}/gpp"
        make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
