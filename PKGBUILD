# Maintainer: Joffrey <j-off@live.fr>

_name='djangosaml2'
pkgname='python-django-saml2'
pkgver=1.8.0
pkgrel=1
pkgdesc='A Django application that builds a Fully Compliant SAML2 Service Provider'
arch=('any')
url="https://github.com/IdentityPython/$_name"
license=('Apache')
depends=('python-django' 'python-pysaml2')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('81d31f5e2dc275dbab7440dffb486323546a123f59c4920c0eee26cdd6f026ff')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
