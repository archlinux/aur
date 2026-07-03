# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>

pkgname='vrcx-0-bin'
pkgdesc='Friendship management tool for VRChat (Tauri version)'
pkgver='2.11.0'
pkgrel='1'
arch=('x86_64')
url='https://github.com/Map1en/VRCX-0'
license=(
  'GPL-3.0'
  'MIT'
)
depends=('webkit2gtk-4.1' 'libappindicator')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("https://github.com/Map1en/VRCX-0/releases/download/v${pkgver}/VRCX-0_${pkgver}_linux_x86_64.deb")
sha256sums=('c1123bc0a083c0c367545cb4e7607ca9d2d0ed7e1a0335a6bae883aa3aa630bf')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
