# Maintainer: Manifest0
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=6.11.0
pkgrel=1
pkgdesc='Cloud Downloader, BitTorrent Client and Media Player'
arch=('x86_64')
url='http://www.frostwire.com'
license=('GPL')
depends=('hicolor-icon-theme' 'java-environment' 'bash' 'zlib')
optdepends=('mplayer: Media playback support')
source=(https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname}-desktop-${pkgver}-build-317/${pkgname}-${pkgver}.amd64.deb)
sha256sums=('8a399a5b07b8278ac91518b25c125af62d894538c9308a8d1a678b6d0f299a69')
 
package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
