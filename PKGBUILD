# Iván Viso - ivanviso123@gmail.com
pkgname=bitshares-wallet-bin
pkgver=2.0.180215
pkgrel=1
pkgdesc='Bitshares wallet and client to the Bitshares network'
arch=('x86_64')
url='https://bitshares.org/'
license=('MIT')
depends=('libxkbfile' 'c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' )
source=("${pkgname}-${pkgver}.deb::https://github.com/bitshares/bitshares-ui/releases/download/2.0.180215/BitShares2-light_${pkgver[@]##*-bin}_amd64.deb")
sha256sums=('0190aa7ff7650bcbf1a38df0b8e5e98955b73af555fd68af8fd6afb135c66bcc')

package() {
	tar -xf data.tar.xz -C "${pkgdir}"  
}
