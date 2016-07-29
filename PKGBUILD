# $Id: PKGBUILD 182622 2016-07-10 18:58:46Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sage-notebook-exporter
pkgver=2.0
pkgrel=1
pkgdesc="Jupyter extension to export notebooks from SageNB"
arch=(any)
url="https://github.com/vbraun/ExportSageNB"
license=(GPL3)
depends=(jupyter-nbconvert ipython python-six)
makedepends=(python-setuptools)
source=("https://github.com/vbraun/ExportSageNB/archive/v$pkgver.tar.gz")
md5sums=('e657f30d2d6cf8d23626c75411f6818c')

package() {
  cd ExportSageNB-$pkgver

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
