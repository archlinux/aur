# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=kiibohd-configurator-bin
_pkgname=kiibohd-configurator
pkgver=1.0.0
pkgrel=1
pkgdesc="Client Side Configuration & Flashing Software for Kiibohd compatible keyboards"
arch=('x86_64')
url="https://github.com/kiibohd/configurator"
license=('GPL3')
depends=('dfu-util')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://github.com/kiibohd/configurator/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz")
sha256sums=('68ee7809f21a7ac42049ddc8f86773fead48e70f46195677a7db059881b55e44')

package() {
  _output="${srcdir}/${pkgname/-bin/}-${pkgver}-linux-x64"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
