pkgname=hoshi-bin
pkgver=1.0.1
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
  '086188114d29cc86991b8b38ccbe80d8c384ac1e39a4ae1547689a66e8a17f93'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
