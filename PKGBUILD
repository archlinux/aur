pkgname=gorae-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal-first TUI librarian for PDFs & EPUBs (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Han8931/gorae"
license=('MIT')  # repo license is MIT :contentReference[oaicite:2]{index=2}
depends=('glibc' 'poppler')  # pdfinfo/pdftotext come from poppler
optdepends=(
  'zathura: recommended PDF viewer'
  'zathura-pdf-mupdf: mupdf backend for zathura'
)
provides=('gorae')
conflicts=('gorae')

source=(
  "gorae::${url}/releases/download/v${pkgver}/gorae-linux-amd64"
)
sha256sums=('34d8cd072098fe0613542dc33c02a6007ae376915b1c26084a3f42c51b706861')

package() {
  install -Dm755 "gorae" "${pkgdir}/usr/bin/gorae"
}
