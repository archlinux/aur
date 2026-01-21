pkgname=openwork
pkgver=0.2.9
pkgrel=1
pkgdesc="OpenWork desktop app for OpenCode"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
source=("${pkgname}-${pkgver}.deb::https://github.com/different-ai/openwork/releases/download/v${pkgver}/OpenWork_${pkgver}_amd64.deb")
sha256sums=('a36e6db9b70b42e0b11d0a390979a7f4a1d0b91900ed049aa4521d1e9fe14ab5')

package() {
  cd "${srcdir}"
  ar x "${pkgname}-${pkgver}.deb"
  tar -xf data.tar.gz -C "${pkgdir}"
}
