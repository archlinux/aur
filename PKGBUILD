pkgname=hoshi-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Hoshi desktop app"
arch=('x86_64')
url="https://github.com/hoshi-io/hoshi"
license=('AGPL')

depends=(
  'gtk3'
  'webkit2gtk-4.1'
)

source=(
  "${url}/releases/download/v${pkgver}/hoshi-desktop-linux-v${pkgver}.deb"
)

sha256sums=(
  '2a7f13a97ada03e3fb2b7badd6dd3b3b1d4a421da52a55eb31a7d02799d87e4a'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
