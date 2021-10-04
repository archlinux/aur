# Maintainer: artemtech <sofyanartem@gmail.com>

_pkgname=vktablet
pkgname=veikk-tablet-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Veikk tablet driver retrieved from official veikk website"
arch=("x86_64")
url="https://www.veikk.com"
license=("GPLv3")
provides=("veikk-tablet-bin")
source=("${_pkgname}-${pkgver}-${pkgrel}.${arch}.rpm::https://www.veikk.com/comp/xcompanyFile/download.do?fid=86&appId=24&id=41")
md5sums=("SKIP")

package() {
  cp -r "${srcdir}/etc" "${pkgdir}/etc"
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  cp -r "${srcdir}/lib" "${pkgdir}/usr"
}

