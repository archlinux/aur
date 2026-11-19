pkgname=hoshi-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Hoshi desktop app"
arch=('x86_64')
url="https://github.com/hoshi-io/hoshi"
license=('AGPL')

depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libmpv.so'
)

source=(
  "${url}/releases/download/v${pkgver}/hoshi-desktop-linux-v${pkgver}.deb"
)

sha256sums=(
  'e9ec036c6806fd2db129ca9fc7d097eab44ecffb65f85e700623e960a2258c29'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
