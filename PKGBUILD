# Maintainer: Henry-ZHR <henry-zhr@qq.com>
# Contributor: foobat <scratcher@foxmail.com>
_pkgname=fcitx5-breeze
pkgname="${_pkgname}1"
pkgver=1.0.0
pkgrel=1
pkgdesc="Fcitx5 theme to match KDE's Breeze style"
arch=('any')
url="https://github.com/scratch-er/fcitx5-breeze"
license=('GPL3')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/scratch-er/fcitx5-breeze/archive/v${pkgver}.tar.gz")
sha512sums=('cb22c5ce54df2e286f1359125ebb7b5ab4a382ef68055aa4385be66b7bae253c0468f7e9fe7645d80480fc8010e13771cc955ea1ef676829dccbb9509eca6c63')

package() {
  cd "${_pkgname}-${pkgver}"
  ./install.sh "${pkgdir}/usr"
}
