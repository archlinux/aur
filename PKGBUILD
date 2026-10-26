pkgname=hoshi-bin
pkgver=1.2.2
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
  '61424d58afb861e45ff5eefd21a5e4beab4339f057d19a2557b0c1c352bbdef4'
)

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
