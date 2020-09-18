# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=6.8.7
pkgrel=1
pkgdesc='Cloud Downloader, BitTorrent Client and Media Player'
arch=('x86_64')
url='http://www.frostwire.com'
license=('GPL')
depends=('hicolor-icon-theme' 'java-environment' 'bash')
optdepends=('mplayer: Media playback support')
source=("${pkgname}-${pkgver}.deb::https://prime.frostwire.com/frostwire/${pkgver}/frostwire-${pkgver}.amd64.deb")
sha256sums=('c554666f061ff0933f601a497335f64a26f14c02f297f167a20a62595315c0a9')
 
package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
