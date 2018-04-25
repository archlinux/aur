# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=shyaml
pkgver=0.5.2
pkgrel=2
pkgdesc='YAML for the command line'
arch=('x86_64')
url="https://github.com/0k/$pkgname"
license=('BSD')
depends=('python' 'python-yaml')
makedepends=()
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('ea4f9df4bfbe2d3aaf9154b6875ff34aac92b36a5ff9eeedbd6bd82719d17fbc')

package() {
    cd "$srcdir/$pkgname"

    python setup.py install --root="$pkgdir/" --optimize=1
}
