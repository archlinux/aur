# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-img2pdf
pkgver=0.2.1
pkgrel=1
pkgdesc="Losslessly convert raster images to PDF"
url="https://gitlab.mister-muffin.de/josch/img2pdf"
arch=('any')
license=('LGPL')
depends=('python' 'python-pillow')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/8b/fa/a69becbc9b2f1c5eff52ae1dc4d7394de239729be252e8ff6a50a21c0a4d/img2pdf-${pkgver}.tar.gz")
sha256sums=('11bf6ae5cce133249cb8fe0638fd1a7dbf22c5291a2a136ea715fb2fe4cf10f0')

package() {
  cd "${srcdir}/img2pdf-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
