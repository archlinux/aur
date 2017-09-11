# Maintainer: Michael Greene <mgreene@securityinnovation.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>

pkgname=python-elasticsearch
_gitname=elasticsearch-py
_gitauthor=elasticsearch
pkgver=5.4.0
pkgrel=1
pkgdesc="Python client for Elasticsearch"
arch=('any')
url="https://github.com/elasticsearch/elasticsearch-py"
license=('APACHE')
groups=()
depends=('python' 'elasticsearch' 'python-urllib3')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/$_gitauthor/$_gitname/archive/$pkgver.tar.gz")
sha512sums=('9d30ffa810f495662769e6d2f2627f9ef6aa3849bc2eecd09df28c05a036b8fb15ae465914c38eeb3d854683bc150a3c56425388312bcd112bd5cc7b33ad41ae')

package() {
    cd "$srcdir/$_gitname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
