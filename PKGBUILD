# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=general-preprocessor
pkgver=2.1.2
pkgrel=1
pkgdesc="Bash-based preprocessor for anything"
url="https://github.com/maandree/gpp"
arch=(any)
license=('custom:ISC')
depends=()
optdepends=('bash: default shell')
source=("gpp-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(7b4dce40443c23dbb6c0d4593fb167ae8a754510b55afb1b5e49645fc27260eb)


build () {
        cd "${srcdir}/gpp-${pkgver}"
        make PREFIX="/usr" DESTDIR="${pkgdir}"
}

package () {
        cd "${srcdir}/gpp-${pkgver}"
        make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
