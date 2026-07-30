# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>

_pkgname='fancymumble'
pkgname="${_pkgname}-bin"
pkgdesc='A Modern, Feature-Rich Mumble Client'
pkgver='0.3.0'
pkgrel='1'
arch=('x86_64')
url='https://github.com/Map1en/VRCX-0'
license=(
  'MIT'
)
depends=('webkit2gtk-4.1' 'libappindicator')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://github.com/Fancy-Mumble/FancyMumble/releases/download/v${pkgver}/FancyMumble_${pkgver}_amd64.deb")
sha256sums=('12de8ac15bfff11ae8cf4f024d86e17f9f66bafa0a48c60f897c9db6daa130c7')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
