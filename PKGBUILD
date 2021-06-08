# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=python-discord-webhook
_name=discord-webhook
pkgver=0.14.0
pkgrel=1
pkgdesc="Execute Discord webhooks."
arch=('any')
url="https://github.com/lovvskillz/python-discord-webhook"
license=('MIT')
depends=('python-requests')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f3d660df572caaa9c2621edd7e8634a70d6d8295ce9256c365838312457069a1')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
