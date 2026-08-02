# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>

_pkgname='vrcx-0'
pkgname="${_pkgname}-bin"
pkgdesc='Friendship management tool for VRChat (Tauri version)'
pkgver='2.20.0'
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
sha256sums=('7d55f7fc2f8083b7c81d6bd636de0cc8eb69f951e0dc5a6ecb435854a3af5965')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
