# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparakstitajs3
pkgver=1.5.5
pkgrel=1
pkgdesc="Application software to sign and validate documents in EDOC and PDF formats."
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('custom:E-PARAKSTĪTĀJS 3')
groups=('eparaksts')
depends=('alsa-lib' 'gtk2' 'java-environment' 'libglvnd' 'libnet' 'libxslt' 'libxtst')
optdepends=('python2-nautilus: Nautilus context menu integration'
            'eparaksts-token-signing: eParaksts browser plugins'
            'latvia-eid-middleware: libraries for Latvia eID cards')
source=("https://download.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/e/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('72843901be46b39e21f400e50ce2f8f67c36af913d971c83ef1c328c3830ca4fc1fc65d04fffc8f2a8682c80d1211a14d762667474b9efe3abe5ea8a7a9c8867')

package() {

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/eparakstitajs3/copyright" "${pkgdir}/usr/share/licenses/$pkgname/copyright"

}
