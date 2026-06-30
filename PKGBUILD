pkgname=hoshi-bin
pkgver=1.1.1
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
  '56f3eeaa02840a8817207a4bfd2adb931cc20ebfb926f35de788bc563f98f947'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
