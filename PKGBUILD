# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=python-shyaml
pkgver=0.3.4
pkgrel=1
pkgdesc='YAML for the command line'
arch=('x86_64')
url='https://github.com/0k/shyaml'
license=('BSD')
depends=('python' 'python-yaml')
makedepends=()
source=("git+https://github.com/0k/shyaml.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/shyaml"

    git checkout $pkgver
}

package() {
    cd "$srcdir/shyaml"

    python setup.py install --root="$pkgdir/" --optimize=1
}
