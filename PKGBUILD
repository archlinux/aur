pkgname=hoshi-bin
pkgver=1.2.0
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
  '8ade9357b711c92cb068b87767a5fe483c8bcc3c4a95929361b53271dc910bcd'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
