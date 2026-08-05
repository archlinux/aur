# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>

_pkgname='vrcx-0'
pkgname="${_pkgname}-bin"
pkgdesc='Friendship management tool for VRChat (Tauri version)'
pkgver='2.21.1'
pkgrel='1'
arch=('x86_64')
url='https://github.com/Map1en/VRCX-0'
license=(
  'GPL-3.0'
  'MIT'
)
depends=('webkit2gtk-4.1' 'libappindicator')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://github.com/Map1en/VRCX-0/releases/download/v${pkgver}/VRCX-0_${pkgver}_linux_x86_64.deb")
sha256sums=('a708dcf2d822151893e9ef95f57d48581bdbeeeae392173b3527c3234b550f1d')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
