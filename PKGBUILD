# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=latvia-eid-middleware
pkgver=1.2.12
pkgrel=1
pkgdesc="Middleware for using Latvia-eid smart cards"
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('LGPL')
groups=('eparaksts')
depends=('ccid' 'libpng12' 'libtool' 'openssl-1.0' 'zlib')
install='middleware.install'
source=("https://download.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/l/${pkgname}/${pkgname}_${pkgver}-3_amd64.deb")
sha512sums=('99ba6379d60b2eef786c418e2fe38a0a63561ecb86994cc2036827e5d16d8a3504f4d693cfc93824d3614d29eda776a4c704e33f6a1d537aab60e30124b7aa31')

package() {

  tar -xzf data.tar.gz -C "${pkgdir}"

}
