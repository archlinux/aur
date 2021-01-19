# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=6.9.1
pkgrel=1
pkgdesc='Cloud Downloader, BitTorrent Client and Media Player'
arch=('x86_64')
url='http://www.frostwire.com'
license=('GPL')
depends=('hicolor-icon-theme' 'java-environment' 'bash' 'zlib')
optdepends=('mplayer: Media playback support')
source=("${pkgname}-${pkgver}.deb::https://prime.frostwire.com/frostwire/${pkgver}/frostwire-${pkgver}.amd64.deb")
sha256sums=('b442b78791b1d4089c92e4e2a37841b1dbee9f1101314060e965a42da9327429')
 
package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
