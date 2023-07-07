# Maintainer: Andreas Bakseter <andreas_tkd at hotmail dot com>
# Author: Andreas Mueller <t3kcit at gmail dot com>

pkgname=python-mglearn
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="Helper functions for the book \"Introduction to Machine Learning with Python\""
arch=(any)
url="https://github.com/amueller/mglearn"
license=(BSD)
depends=("python" "python-numpy" "python-matplotlib" "python-scikit-learn" "python-pandas" "python-pillow" "python-cycler" "python-joblib" "python-six" "python-imageio")
source=("$url/archive/$pkgver.tar.gz")
md5sums=('6070e566dc54e46cfb749c22513abacc')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="${pkgdir}"
}
