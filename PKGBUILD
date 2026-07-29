# Maintainer: Miguel Scaramozzino <mikele@gmail.com>
pkgname=pipeiris-bin
pkgver=0.2.0
pkgrel=2
pkgdesc='Fullscreen PipeWire audio flow inspector for Linux'
arch=('x86_64')
options=('!strip')
url='https://github.com/mikelexp/pipeiris'
license=('custom')
depends=('pipewire')
optdepends=('wireplumber: optional wpctl command for additional metadata')
source=("${url}/releases/download/v${pkgver}/pipeiris-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('202c5b9d91a1d2233e611f73eb6534aa4bae469a6bc9678e7dd4e69bbbf02877')

package() {
  install -Dm755 "${srcdir}/pipeiris" "${pkgdir}/usr/bin/pipeiris"
}
