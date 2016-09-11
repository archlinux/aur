# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname='python-memcached'
pkgver=1.58
pkgrel=1
pkgdesc="A python memcached client library"
arch=('any')
url="https://github.com/linsomniac/python-memcached"
license=('PSF')

source=("https://pypi.python.org/packages/f7/62/14b2448cfb04427366f24104c9da97cf8ea380d7258a3233f066a951a8d8/python-memcached-${pkgver}.tar.gz")
makedepends=('python')
depends=('python' 'memcached')
md5sums=('23b258105013d14d899828d334e6b044')


package() {
  cd "$srcdir/python-memcached-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
