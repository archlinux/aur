# Maintainer: JP-Ellis <coujellis@gmail.com>

pkgname=searchpdf
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple script to search through PDF files."
url="http://github.com/JP-Ellis/searchpdf"
arch=('any')
license=('MIT')
depends=('poppler' 'zsh')
source=("searchpdf"
        "LICENSE")
sha256sums=('fa40498a5a8a8786569a9dccdf22ef461147b2ca094e75efd3e0fa866f2e0809'
            '16157e0292310978360f4cdc134fdec7207312320c99264f03901921fbfdbfa2')

package() {
  install -Dm755 "${srcdir}/searchpdf" "${pkgdir}/usr/bin/searchpdf"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Local Variables:
# mode: sh
# End:
