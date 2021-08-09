# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=general-preprocessor
pkgver=2.1.1
pkgrel=1
pkgdesc="Bash-based preprocessor for anything"
url="https://github.com/maandree/gpp"
arch=(any)
license=('custom:ISC')
depends=()
optdepends=('bash: default shell')
source=("gpp-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(20bec3e76e70ee856cddee06cd692daa1d0a8c50e9e7d37ee7ae1c106ed9fb23)


build () {
        cd "${srcdir}/gpp-${pkgver}"
        make PREFIX="/usr" DESTDIR="${pkgdir}"
}

package () {
        cd "${srcdir}/gpp-${pkgver}"
        make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
