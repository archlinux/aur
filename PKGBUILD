# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=latvia-eid-middleware
pkgver=2.0.4
pkgrel=2
pkgdesc="Middleware for using Latvia-eid smart cards"
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('LGPL')
groups=('eparaksts')
depends=('ccid' 'glu' 'gtk2' 'libpng12' 'libsm' 'libtool' 'openssl-1.0' 'zlib')
install='middleware.install'
source=("https://download.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/l/${pkgname}/${pkgname}_${pkgver}-1_amd64.deb")
sha512sums=('c85d866f412bdbafa9a3b052601b448ad95c2b04c6739a2db7138e955eebc4d293a0c562843315075d672da854842e8752e7ccfab6519857ad83819b3b967ff5')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

}
