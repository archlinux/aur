# Maintainer: Inche Hwang <inner5740@gmail.com>
# Contributor: Alif Zakiansyah As Syauqi <alifzakiansyah10@gmail.com>
pkgname="spoof-dpi-bin"
pkgver=0.8
pkgrel=1
# epoch=
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(x86_64)
url="https://github.com/xvzc/SpoofDPI"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(spoof-dpi)
conflicts=(spoof-dpi)
replaces=()
backup=()
options=()
install=
changelog=
source=("spoof-dpi.service"
        "${url}/raw/main/LICENSE"
        "${pkgname/-bin/}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/${pkgver}/${pkgname/-bin/}-linux.tar.gz")
noextract=()
md5sums=("d6d5ee0dfa44d0503e75d8f2fa3178d9"
  "e1f6858d174b262382b078db452046fa"
  "0743f8eb555c7859a578791621981a58")
# validpgpkeys=()

package() {
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 spoof-dpi "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm 644 spoof-dpi.service "${pkgdir}/usr/lib/systemd/system/spoof-dpi.service"
}
