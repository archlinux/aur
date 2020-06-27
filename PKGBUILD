# Maintainer GI_Jack <GI_Jack@hackermail.com>
# Contributer: Paul Taylor <bao7uo at gmail dot com>
# Contributer: BlackArch

pkgname='python-bs4'
pkgver='0.0.1'
pkgrel=1
pkgdesc='Beautiful Soup. bs4 name required by CrackMapExec trunk'
arch=('any')
url='https://pypi.python.org/pypi/bs4/'
license=('custom:unknown')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/10/ed/7e8b97591f6f456174139ec089c769f89a94a1a4025fe967691de971f314/bs4-${pkgver}.tar.gz")
sha1sums=('b309d9b50489cc64263d11491e6a19c29c3a484d')

build() {
  cd "$srcdir/bs4-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/bs4-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

