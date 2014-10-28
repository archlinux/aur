# Maintainer: James An <james@jamesan.ca>

pkgname=pmsencoder-bin
_pkgname=pmsencoder
pkgver=2.0.0
pkgrel=1
pkgdesc="A web video plugin for PS3 Media Server"
arch=('i686' 'x86_64') # TODO: check if PMS is arch-independent
url="https://github.com/chocolateboy/${_pkgname}"
license=('Artistic2.0')
depends=('pms>=1.90.0.' 'java-runtime')

source=("https://github.com/chocolateboy/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.jar")
noextract=("${_pkgname}-${pkgver}.jar")
md5sums=('596d4ae8cd0e55686eee89b6890609f2')

package() {
    install -Dm755 "${_pkgname}-${pkgver}.jar" "${pkgdir}/opt/pms/plugins/${_pkgname}-${pkgver}.jar"
}
