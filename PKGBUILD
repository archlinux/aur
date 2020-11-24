# Maintainer: Agustin Carrasco <asermax at gmail dot com>
pkgname=plasma5-runners-nordvpn
reponame=NordVPNKrunner
pkgver=2.0.0
pkgrel=1
pkgdesc="Nordvpn plasma runner"
arch=("any")
url="https://github.com/alex1701c/${reponame}"
license=("MIT")
depends=("nordvpn-bin" "qt5-base" "krunner")
source=("https://github.com/alex1701c/${reponame}/archive/${pkgver}.tar.gz")
md5sums=('669f6163c74fd90c85916b7233f84933')

package() {
  cd "${reponame}-${pkgver}"
  head -n -4 install.sh > install.sh.tmp && mv install.sh.tmp install.sh
  chmod +x install.sh
  ./install.sh
}
