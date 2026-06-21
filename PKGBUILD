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
  '81db4fd30850fc07714e1c60883adf2a616e06442af9c3617c9c1ddbce74581c'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
