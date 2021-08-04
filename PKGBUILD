# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=general-preprocessor
pkgver=2.1
pkgrel=1
pkgdesc="Bash-based preprocessor for anything"
url="https://github.com/maandree/gpp"
arch=(any)
license=('custom:ISC')
depends=()
optdepends=('bash: default shell')
source=("gpp-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(ef305acf927ba6a37aa7e250b3a3d4f1fd4e0513a98acd6d2bdcdc15e4930faf)


build () {
        cd "${srcdir}/gpp-${pkgver}"
        make PREFIX="/usr" DESTDIR="${pkgdir}"
}

package () {
        cd "${srcdir}/gpp-${pkgver}"
        make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
