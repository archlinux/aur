# Maintainer: Erik Katzenberger <mail@wirecat.cc>
pkgname=apple_hyprcursor
pkgver=0.1
pkgrel=1
pkgdesc="Hyprcursor version of https://github.com/ful1e5/apple_cursor"
arch=(any)
url="https://github.com/6ooker/apple_hyprcursor"
license=('GPL3')
source=(
  "macOS-hypr_${pkgver}.tar.xz::${url}/releases/download/${pkgver}/macOS-hypr.tar.xz"
)
noextract=("${source[@]##*/}")
sha256sums=(
  'e217e683f4c4f02d0709ec8f902686acc91030abc64f42dfd511fde148da83fb'
)

package() {
  install -dm755 "${pkgdir}/usr/share/icons/macOS-hypr"
  tar --no-same-owner -xvf "macOS-hypr_${pkgver}.tar.xz" -C "${pkgdir}/usr/share/icons/"
}
