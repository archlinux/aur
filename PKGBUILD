# Maintainer: Midov <midov@midov.pl>

pkgname=python-blist
_name=blist
pkgver=1.3.6
pkgrel=4
pkgdesc="A list-like type with better asymptotic performance"
arch=(i686 x86_64)
url="https://pypi.org/project/blist/"
license=('GPL')
depends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/6b/a8/dca5224abe81ccf8db81f8a2ca3d63e7a5fa7a86adc198d4e268c67ce884/${_name}-${pkgver}.tar.gz")
sha256sums=('3a12c450b001bdf895b30ae818d4d6d3f1552096b8c995f0fe0c74bef04d1fc3')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
