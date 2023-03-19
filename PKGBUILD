# Maintainer: Midov <midov@midov.pl>

pkgname=python-html-sanitizer
_name=html_sanitizer
pkgver=1.9.3
pkgrel=1
pkgdesc="Allowlist-based and very opinionated HTML sanitizer that can be used both for untrusted and trusted sources."
arch=('any')
url="https://pypi.org/project/html-sanitizer/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/a4/fc/de10c9964f3033719f41bc38af2ac13453d3e23c9a0aa437f6acb8bb11cb/${_name}-${pkgver}.tar.gz")
sha256sums=('6e2f15c959decf33a1d0b953b40147ada9c724cec1fb469a3141be7b003653d5')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
