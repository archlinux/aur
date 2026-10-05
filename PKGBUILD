pkgname=hoshi-bin
pkgver=1.2.1
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
  'b7039344a8fe1e602cd644d611e27a53c0a776f14d8fb1f3080cf421f6bfc118'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
