# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=cppman
pkgver=0.4.5
pkgrel=1
pkgdesc="C++ 98/11/14 manual pages for Linux/MacOS"
arch=('any')
url="https://github.com/aitjcize/cppman"
license=('GPL')
conflicts=(cppman-git)
depends=(python3 vim groff python-beautifulsoup4)
source=("https://pypi.python.org/packages/source/c/cppman/${pkgname}-${pkgver}.tar.gz")
md5sums=('f97b52fda330bab6b315a473622001dd')



build() {
  cd ${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python3 setup.py install --root=${pkgdir}/ --optimize=1
}
