# Maintainer: Michael Greene <mgreene@securityinnovation.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>

pkgname=python-elasticsearch
_gitname=elasticsearch-py
_gitauthor=elasticsearch
pkgver=5.0.1
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
sha512sums=('a10483c853b3b1b6a9a250ceb51738b5351764cde18140b0b754f6563aa5ed8d3095063e85524968adc0faeb846acebedeeab7a29533e3025db698db228823d9')

package() {
    cd "$srcdir/$_gitname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
