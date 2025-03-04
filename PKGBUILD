# Maintainer: Yukina <thienphuc3230 at gmail dot com>

_pkgname="Qogir-icon-theme"
_pkgver=2025-02-15
pkgname="qogir-cursor-theme"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An x-cursor theme inspired by Qogir theme and based on capitaine-cursors"
arch=("any")
url="https://github.com/vinceliuice/${_pkgname}"
license=("GPL3")
provides=("${pkgname}")
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/$_pkgver.tar.gz")
sha256sums=("SKIP")

package() {
  install -d "${pkgdir}/usr/share/icons/"
  cd "${srcdir}/${_pkgname}-${_pkgver}/src/cursors/"
  cp -r dist/ ${pkgdir}/usr/share/icons/Qogir-cursors/
  cp -r dist-Dark/ ${pkgdir}/usr/share/icons/Qogir-white-cursors/
  cp -r dist-Ubuntu/ ${pkgdir}/usr/share/icons/Qogir-Ubuntu-cursors/
  cp -r dist-Ubuntu-Dark/ ${pkgdir}/usr/share/icons/Qogir-Ubuntu-white-cursors/
  cp -r dist-Manjaro/ ${pkgdir}/usr/share/icons/Qogir-Manjaro-cursors/
  cp -r dist-Manjaro-Dark/ ${pkgdir}/usr/share/icons/Qogir-Manjaro-white-cursors/
}
