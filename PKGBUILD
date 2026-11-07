pkgname=hoshi-bin
pkgver=1.2.4
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
  '365ba3bf9c3473c93f909bcb958c6f503f19def77740636806437803c99311a2'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
