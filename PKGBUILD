_pkgver=1.2.4
pkgname=truckers-tool-linux-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="A web-based save editor for ETS2 and ATS on Linux (Desktop App)"
arch=('x86_64')
url="https://github.com/efzynx/truckers-tool-linux"
license=('GPL3')
provides=('truckers-tool-linux')
conflicts=('truckers-tool-linux')
depends=('nss' 'libxss' 'gtk3')
options=('!strip')
source=("https://github.com/efzynx/truckers-tool-linux/releases/download/v${_pkgver}/truckers-tool-linux-${_pkgver}.deb")
sha256sums=('SKIP')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
}
