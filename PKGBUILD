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
  'dc61b3d1f01e6e5d8798e5f5a620f8b070f43b49520f6f693588b7a85e5e8c24'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
