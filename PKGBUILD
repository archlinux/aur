# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=shyaml
pkgver=0.5.0
pkgrel=2
pkgdesc='YAML for the command line'
arch=('x86_64')
url="https://github.com/0k/$pkgname"
license=('BSD')
depends=('python' 'python-yaml')
makedepends=()
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('cd953f7242b82d06845b36a9c523a6751f42c58c7bbff00f90f8cd053081a6e8')

prepare() {
    cd "$srcdir/$pkgname"

    git checkout $pkgver
}

package() {
    cd "$srcdir/$pkgname"

    python setup.py install --root="$pkgdir/" --optimize=1
}
