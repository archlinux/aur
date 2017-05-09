# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=email2pdf
pkgver=0.9.5
pkgrel=1
pkgdesc="Convert EML files to PDF."
url="https://github.com/andrewferrier/email2pdf"
depends=('python-beautifulsoup4' 'python-html5lib' 'python-lxml' 'python-pypdf2' 'python-magic' 'python-reportlab' 'python-requests')
license=('MIT')
arch=('any')
source=("https://github.com/andrewferrier/email2pdf/archive/0.9.5.tar.gz")
sha256sums=('3b321c418983895ebd09eec6676fa59cb7428ccfd3679ee47049d9db67771c9b')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -dm 775 "${pkgdir}/bin"
  install -m 775 email2pdf "${pkgdir}/bin/email2pdf"
}

# vim:set ts=2 sw=2 et:
