# Maintainer: Manifest0
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=6.13.2
pkgrel=1
pkgdesc='Cloud Downloader, BitTorrent Client and Media Player'
arch=('x86_64')
url='http://www.frostwire.com'
license=('GPL')
depends=('hicolor-icon-theme' 'java-environment' 'bash' 'zlib')
optdepends=('mplayer: Media playback support')
source=(https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname}-desktop-${pkgver}-build-321/${pkgname}-${pkgver}.amd64.deb)
sha256sums=('af99db459878b31626c644a917f206aab2669efef78d66fc885f6b3e6787ca5d')
 
package() {
  tar xvf data.tar.zst -C "${pkgdir}"
}


