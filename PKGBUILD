# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-img2pdf
pkgver=0.2.3
pkgrel=1
pkgdesc="Losslessly convert raster images to PDF"
url="https://gitlab.mister-muffin.de/josch/img2pdf"
arch=('any')
license=('LGPL')
depends=('python' 'python-pillow')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/b6/bc/e72a813265a5e7b7319c74130888c60bed441b4a13c2b8f76a33c19541bb/img2pdf-${pkgver}.tar.gz")
sha256sums=('156d9abae0429e30d68c8c8978fbcc23d5a841c6aa8bb914755c5b366f95dc46')

package() {
  cd "${srcdir}/img2pdf-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
