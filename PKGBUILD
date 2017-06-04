# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-cmp_version'
pkgver=2.1.1
pkgrel=1
pkgdesc="A script and python module to compare version numbers. Use this to compare the version strings of packages, modules, really anything."
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/cmp_version"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')

source=("https://github.com/kata198/cmp_version/archive/${pkgver}.tar.gz")
sha512sums=('6152b7f63e2e819399a8714c11fb33461738152e44e152db964709ac10dba90ffef27395abad9957bcf25dc351760246cfe0cc948d340955fe89304abebfdd7d')

build() {
  cd "$srcdir"/cmp_version-$pkgver
  python setup.py build

}

package() {
  cd cmp_version-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}




