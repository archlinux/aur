# Maintainer: Michael Greene <mgreene@securityinnovation.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>

pkgname=python-elasticsearch
_gitname=elasticsearch-py
_gitauthor=elasticsearch
pkgver=2.3.0
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
sha512sums=('53ffc265dc2c42ef983bf12a6d6bfcb96a378da97c58b52ff872968e50f01936815f2d28d667d44a647174d90b55fbe6855ebeac6f86248adb4db4ba951facb1')

package() {
    cd "$srcdir/$_gitname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
