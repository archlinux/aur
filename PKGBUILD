# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=rhythmbox-plugin-tray-icon
pkgver=2020.05.21
pkgrel=1
pkgdesc='A tray icon plugin for rhythmbox music player'
arch=('any')
url="http://packages.linuxmint.com/pool/main/r/${pkgname}"
license=(GPL3)
depends=(
    python-xapp
    rhythmbox
    xapp
)
provides=(
    rhythmbox-tray-icon
)
conflicts=(
    rhythmbox-tray-icon
    rhythmbox-tray-icon-git
)
source=("${pkgname}_${pkgver}.deb::${url}/${pkgname}_${pkgver}_all.deb")
sha256sums=('e9fd16910461b582bf8b74398934c11fc68976a862e11083d469942c2201d23f')

package() {
  tar xf "${srcdir}/data.tar.xz"
  cp -r usr "$pkgdir"
}
