# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparaksts-token-signing
pkgver=2.1.1
pkgrel=1
pkgdesc="eParaksts browser plugins"
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('LGPL')
groups=('eparaksts')
depends=('ccid' 'gtk2' 'openssl-1.0' 'pcsclite' 'qt5-base')
optdepends=('latvia-eid-middleware: libraries for Latvia eID cards')
install='eparaksts.install'
source=("https://download.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/e/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('40a4af8f34503b39a64dcaab02bf2b6f2e7b9c7523548b7d6b27e1326a7d104da5ab70a36fdc2900b4896d4b6fa1a19f7df9b99b74b1bcf134bae5e0dbcced7c')

package() {

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/$pkgname/copyright"

}
