# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>

pkgname=python-elasticsearch
_gitname=elasticsearch-py
_gitauthor=elasticsearch
pkgver=2.1.0
pkgrel=1
pkgdesc="Python client for Elasticsearch"
arch=('any')
url="https://github.com/elasticsearch/elasticsearch-py"
license=('APACHE')
groups=()
depends=('python' 'elasticsearch' 'python-urllib3')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/$_gitauthor/$_gitname/archive/$pkgver.tar.gz")
sha512sums=('445ca902b9b1b0239f751174d812672a623a205bc22da679a61edcd88a29d86be2e1e35421579da1ae34b346476f951c24848015bbf2d437e2209b706044ec0b')

package() {
  cd "$srcdir/$_gitname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
