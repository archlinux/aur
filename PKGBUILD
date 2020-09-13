# Maintainer: Efe Cetin <efectn@6tel.net>
pkgname=chm2pdf-python3
_pkgname=chm2pdf
pkgver=0.9.2
pkgrel=6
pkgdesc="A script that converts CHM files into PDF files."
arch=('any')
url="https://github.com/Zaryob/chm2pdf"
license=('GPL2')
depends=('python' 'python-pychm' 'chmlib' 'htmldoc' 'python-sgmllib')
optdepends=('python-beautifulsoup4: makes HTML files of CHM standards compliant')
source=(https://github.com/Zaryob/chm2pdf/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('3bae5f39ecb1c2c477efcfd98481200f')

package() {
  tar -xzvf ${_pkgname}-${pkgver}.tar.gz
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir"
}
