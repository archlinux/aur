# Maintainer: veikk.com

_pkgname=vktablet
pkgname=veikk-tablet-bin
pkgver=1.0.3
pkgrel=2
pkgdesc="Veikk tablet driver retrieved from official veikk website"
arch=("x86_64")
url="https://www.veikk.com"
license=("GPLv3")
provides=("veikk-tablet-bin")
source=("${_pkgname}-${pkgver}-${pkgrel}.${arch}.rpm::https://www.veikk.com/upload/file/20211217/vktablet-1.0.3-2.x86_64.rpm")
md5sums=("SKIP")

package() {
  cp -r "${srcdir}/etc" "${pkgdir}/etc"
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  cp -r "${srcdir}/lib" "${pkgdir}/usr"
}

