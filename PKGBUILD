# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparakstitajs3
pkgver=1.4.6
pkgrel=1
pkgdesc="Application software to sign and validate documents in EDOC and PDF formats."
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('custom:E-PARAKSTĪTĀJS 3')
groups=('eparaksts')
depends=('libxslt' 'java-environment' 'libnet' 'alsa-lib' 'libglvnd' 'libxtst' 'gtk2')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://download.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/e/eparakstitajs3/${pkgname}_${pkgver}_amd64.deb")
noextract=()
md5sums=('3d27dbefe9f530467efbf05a9aca8a35')

package() {

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/eparakstitajs3/copyright" "${pkgdir}/usr/share/licenses/$pkgname"

}
