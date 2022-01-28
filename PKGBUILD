# Maintainer: Manifest0
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=6.9.7
pkgrel=1
pkgdesc='Cloud Downloader, BitTorrent Client and Media Player'
arch=('x86_64')
url='http://www.frostwire.com'
license=('GPL')
depends=('hicolor-icon-theme' 'java-environment' 'bash' 'zlib')
optdepends=('mplayer: Media playback support')
source=(https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname}-desktop-${pkgver}-build-311/${pkgname}-${pkgver}.amd64.deb)
sha256sums=('4c5806915601f2de21e8605ee61752325b7d86695a69c7f6aed056e2dff674fe')
 
package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
