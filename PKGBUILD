# Maintainer: Midov <midov@midov.pl>

pkgname=python-html-sanitizer
_name=html-sanitizer
pkgver=1.9.0
pkgrel=1
pkgdesc="Allowlist-based and very opinionated HTML sanitizer that can be used both for untrusted and trusted sources."
arch=('any')
url="https://pypi.org/project/filetype/"
license=('GPL')
depends=('python')
source=("https://files.pythonhosted.org/packages/72/ff/88fbb7c46d359f7cbf1f8bc9f63379ed6b5e3940a9fda88f9cf5cedf24da/${_name}-${pkgver}.tar.gz")
sha256sums=('ef86b10c653b288dff4c51c0cc9cf93025c4c6a519a6e40eb1aa152861101929')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
