# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=email2pdf
pkgver=0.9.5.1
pkgrel=1
pkgdesc="Convert EML files to PDF."
url="https://github.com/andrewferrier/email2pdf"
depends=('python-beautifulsoup4' 'python-html5lib' 'python-lxml' 'python-pypdf2' 'python-magic' 'python-reportlab' 'python-requests' 'wkhtmltopdf')
license=('MIT')
arch=('any')
source=("https://github.com/andrewferrier/email2pdf/archive/${pkgver}.tar.gz")
sha256sums=('c11cd970a9335c6b16166c2e5d82cc2dbd4b9ed6bb4fe9e516134a9ea5645238')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -dm 755 "${pkgdir}/usr/bin"
  install -m 775 email2pdf "${pkgdir}/usr/bin/email2pdf"
}

# vim:set ts=2 sw=2 et:
