# Maintainer: envolution
pkgname=python-html2image-bin
_pkgname=html2image
pkgver=2.0.5
pkgrel=2
pkgdesc="Generates images from headless browsers and html/css strings or files"
arch=('x86_64')
url="https://github.com/vgalin/html2image"
license=('MIT')
provides=(python-html2image)
conflicts=(python-html2image)
depends=('python' 'python-websocket-client' 'python-requests')
source=("https://github.com/vgalin/html2image/releases/download/${pkgver}/html2image-${pkgver}-py3-none-any.whl")
md5sums=('43a156406791ea3ff995dc20e4d28f21')

package() {
  python -m installer --destdir="$pkgdir" "html2image-${pkgver}-py3-none-any.whl"
}
