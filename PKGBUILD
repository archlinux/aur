# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-django_bootstrap5
pkgver=0.3.2
pkgrel=1
pkgdesc="Add bootstrap 5 support (css/js) to django."
url="https://github.com/jnphilipp/django_bootstrap5"
depends=('python-django')
makedepends=('python-setuptools')
license=('GPL3+')
arch=(any)
source=("git+https://github.com/jnphilipp/django_bootstrap5.git")
sha256sums=(SKIP)

package() {
    cd "$srcdir/django_bootstrap5"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    make install DEST_DIR=$pkgdir
}
