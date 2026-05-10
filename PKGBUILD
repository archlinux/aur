pkgname=hoshi-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Hoshi desktop app"
arch=('x86_64')
url="https://github.com/dot-fx/hoshi"
license=('AGPL')

depends=(
  'gtk3'
  'webkit2gtk-4.1'
)

source=(
  "${url}/releases/download/v${pkgver}/hoshi-desktop-linux-v${pkgver}.deb"
)

sha256sums=(
  'f2e23f7a1c46e8b1803dbd1ea1689180fc3136f1d4ac91055f971ceb35a46238'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
