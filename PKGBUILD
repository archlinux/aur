# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=6.8.6
pkgrel=1
pkgdesc='Cloud Downloader, BitTorrent Client and Media Player'
arch=('x86_64')
url='http://www.frostwire.com'
license=('GPL')
depends=('hicolor-icon-theme' 'java-environment' 'bash')
optdepends=('mplayer: Media playback support')
source=("${pkgname}-${pkgver}.deb::https://prime.frostwire.com/frostwire/${pkgver}/frostwire-${pkgver}.amd64.deb")
sha256sums=('53da50d719eb1d9d9c1efe4ecc80c16776b1b84a738baf4fb95539135dc53b9c')
 
package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}