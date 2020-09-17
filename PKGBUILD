# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=latvia-eid-middleware
pkgver=2.0.6
pkgrel=1
pkgdesc="Middleware for using Latvia-eid smart cards"
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('LGPL')
groups=('eparaksts')
depends=('gtk2' 'libglvnd' 'openssl-1.0' 'libsm' 'pcsclite')
install='middleware.install'
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/l/${pkgname}/${pkgname}_${pkgver}-1_amd64.deb")
sha512sums=('29f2ad679f3db6b8f825afe88dcf1f873401b130f27bd6afd65c1a34aa2d87972ad2798c27e0f8e795b01b719419bbc6cce3704d0ae4b52e6e2675685a4271cd')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

}
