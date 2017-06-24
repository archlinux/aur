# Maintainer: j605

_name="entrypoint2"
pkgname="python-${_name}"
pkgver=0.0.6
pkgrel=1
pkgdesc="easy to use command-line interface for python modules, fork of entrypoint"
arch=('any')
url="https://github.com/ponty/entrypoint2"
license=('BSD')
depends=('python-argparse' 'python-decorator')
source=("https://pypi.python.org/packages/6f/12/ffea34bdecf8c43e4932897cbaa769068c8a1355b025d283707301fe40ad/$_name-$pkgver.tar.gz")
md5sums=("ab268f561bb22471a83ca602c1921cbc")

package() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
