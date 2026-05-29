# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono-gui"
pkgname=vopono-gui-bin
pkgver=0.10.17
pkgrel=1
pkgdesc='Graphical frontend for vopono'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
depends=('vopono' 'gtk3' 'libayatana-appindicator' 'systemd-libs' 'xdotool')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_gcc")
noextract=("${_pkgname}-${pkgver}")
sha256sums_x86_64=('30406e6f1e9b06a74cc50df4a19b5586f827ef634e404dd117fc31e6a38cafa6')
provides=('vopono-gui')
conflicts=('vopono-gui')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
}
