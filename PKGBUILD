# Maintainer: Midov <midov@midov.pl>

pkgname=python-html-sanitizer
_name=html_sanitizer
pkgver=1.9.3
pkgrel=2
pkgdesc="Allowlist-based and very opinionated HTML sanitizer that can be used both for untrusted and trusted sources."
arch=('any')
url="https://pypi.org/project/html-sanitizer/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/6d/a5/25bf90144aaabbc23cdfcacdb21076a14dd5862183a70610decec4170ede/${_name}-${pkgver}.tar.gz")
sha256sums=('125c5e09b154cab598b6c11731902dcbdd9d0ede72311814ee040fe6ddef82e0')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
