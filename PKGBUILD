# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>

_pkgname='vrcx-0'
pkgname="${_pkgname}-bin"
pkgdesc='Friendship management tool for VRChat (Tauri version)'
pkgver='2.32.0'
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
sha256sums=('b07011adf05a68c58e4db9ff90d992bd1c2ec54223da5ded2281f3ce7648861e')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
