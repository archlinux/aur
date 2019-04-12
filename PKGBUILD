# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-publicsuffix2
pkgver=2.20190205
pkgrel=1
pkgdesc='Get a public suffix for a domain name using the Public Suffix List'
arch=(any)
url=https://pypi.python.org/pypi/publicsuffix2
license=(MIT)
depends=(python)
source=(https://pypi.python.org/packages/source/p/publicsuffix2/publicsuffix2-$pkgver.tar.gz)
sha512sums=('359052a2b41f63be3f87b23605b5229424f2dcf06b5bd9e9b5f1988cf9df5171188b94d54ed0be37099d94afd6efe6cfa75be27aef262e6c5af0ded61dfc6258')

build() {
  cd publicsuffix2-$pkgver
  python setup.py build
}

package() {
  cd publicsuffix2-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
