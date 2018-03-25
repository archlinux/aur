# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=chm-to-pdf
pkgver=0.01
pkgrel=3
arch=('any')
license=('GPL')
pkgdesc="Convert CHM files to PDF documents"
url="http://code.google.com/p/trizen/downloads/detail?name=${pkgname}-${pkgver}.tar.gz"
depends=('perl' 'perl-text-chm' 'perl-uri' 'wkhtmltopdf-static')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/trizen/${pkgname}-${pkgver}.tar.gz")
sha256sums=('836a02255f9cc4d9b0e64fb418042301703f2829ade44d43e2bc41dda40bc3a9')

package() {
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}"
}
