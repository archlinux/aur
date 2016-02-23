# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-img2pdf
pkgver=0.2
pkgrel=1
pkgdesc="Losslessly convert raster images to PDF"
url="https://gitlab.mister-muffin.de/josch/img2pdf"
arch=('any')
license=('LGPL')
depends=('python' 'python-pillow')
source=("https://pypi.python.org/packages/source/i/img2pdf/img2pdf-${pkgver}.tar.gz")
sha256sums=('ee66783fa97440f587aef662119b1014b704feff8c783e9e29412998c42ef70c')

package() {
  cd "${srcdir}/img2pdf-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
