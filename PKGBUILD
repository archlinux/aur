# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=6.8.10
pkgrel=1
pkgdesc='Cloud Downloader, BitTorrent Client and Media Player'
arch=('x86_64')
url='http://www.frostwire.com'
license=('GPL')
depends=('hicolor-icon-theme' 'java-environment' 'bash' 'zlib')
optdepends=('mplayer: Media playback support')
source=("${pkgname}-${pkgver}.deb::https://prime.frostwire.com/frostwire/${pkgver}/frostwire-${pkgver}.amd64.deb")
sha256sums=('abbd9025fbac98412bc210a773eba07ff544de51f1bff0ee739da8d40a740b6b')
 
package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
