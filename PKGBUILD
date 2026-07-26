# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>

pkgname='vrcx-0-bin'
pkgdesc='Friendship management tool for VRChat (Tauri version)'
pkgver='2.17.0'
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
sha256sums=('62b393e35d19631a7fc6a0aa397866c39758b508cf5ba293f2a868c3ff0a635a')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
