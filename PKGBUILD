# Maintainer: veikk.com

_pkgname=vktablet
pkgname=veikk-tablet-bin
pkgver=1.2.3
_pkgv=$(echo ${pkgver} | sed 's/_/-/')
pkgrel=1
pkgdesc="Veikk tablet driver retrieved from official veikk website"
arch=("x86_64")
url="https://www.veikk.com"
license=("GPLv3")
provides=("veikk-tablet-bin")
source=("https://veikk.com/image/catalog/Software/new/${_pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
md5sums=("a50fc05703dff80ddb49e25022db292e")


package() {
  cp -r "${srcdir}/etc" "${pkgdir}/etc"
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  cp -r "${srcdir}/lib" "${pkgdir}/usr"
}

