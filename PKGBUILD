# Maintainer: David Manouchehri <david@davidmanouchehri.com>
# Former Maintainer/Contributor: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>

pkgname=python-elasticsearch
_gitname=elasticsearch-py
_gitauthor=elasticsearch
pkgver=1.4.0
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
sha512sums=('dbe51362f68d40e95a0cfefde4feb8d9d9c61b4f4795cbf69fd70bf981f290812ebac19a20ae8594cc39ac46a3c35ddfe450ff436fca0fada060736128478cf7')

package() {
  cd "$srcdir/$_gitname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
