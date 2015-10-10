# Maintainer: David Manouchehri <david@davidmanouchehri.com>
# Contributor: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>

pkgname=python-elasticsearch
_gitname=elasticsearch-py
_gitauthor=elasticsearch
pkgver=1.7.0
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
sha512sums=('a2e255c2615f6de36760a86e59d9a1798d076e87b6e176efc8a3e4dfb52558c25b8d5ba9b1560bebc8b77687d0451ce45d7faaac21e2ba8d98bc41297021229e')

package() {
  cd "$srcdir/$_gitname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
