pkgname=hoshi-bin
pkgver=1.1.3
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
  '0531380db108b8fde4741fdc266cfeaeb7a3583803e7a3c9d5d38f1b1771fde8'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
