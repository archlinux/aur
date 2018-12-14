# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=shyaml
pkgver=0.6.1
pkgrel=1
pkgdesc='YAML for the command line'
arch=('x86_64')
url="https://github.com/0k/$pkgname"
license=('BSD')
depends=('python' 'python-yaml')
makedepends=()
replaces=('python-shyaml')
source=("git+https://github.com/0k/$pkgname")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"

    git checkout $pkgver
}

package() {
    cd "$srcdir/$pkgname"

    python setup.py install --root="$pkgdir/" --optimize=1
}
