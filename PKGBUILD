# Maintainer: Manifest0
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=6.9.8
pkgrel=1
pkgdesc='Cloud Downloader, BitTorrent Client and Media Player'
arch=('x86_64')
url='http://www.frostwire.com'
license=('GPL')
depends=('hicolor-icon-theme' 'java-environment' 'bash' 'zlib')
optdepends=('mplayer: Media playback support')
source=(https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname}-desktop-${pkgver}-build-312/${pkgname}-${pkgver}.amd64.deb)
sha256sums=('ca7998987924bbcd4193a083c570fb287ab553890fe7b086606a9ad65efe7515')
 
package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
