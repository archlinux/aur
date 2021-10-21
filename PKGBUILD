# Maintainer: Manifest0
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=6.9.5
pkgrel=1
pkgdesc='Cloud Downloader, BitTorrent Client and Media Player'
arch=('x86_64')
url='http://www.frostwire.com'
license=('GPL')
depends=('hicolor-icon-theme' 'java-environment' 'bash' 'zlib')
optdepends=('mplayer: Media playback support')
source=(https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname}-desktop-${pkgver}-build-308/${pkgname}-${pkgver}.amd64.deb)
sha256sums=('a6de8305bd15983aed50193e9e589240345a1d325f1ae58ebc0b3d79a9678318')


 
package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
