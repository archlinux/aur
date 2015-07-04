# Maintainer: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>

_name=cryptacular
pkgname=python2-${_name}
pkgver=1.4.1
pkgrel=1
pkgdesc="A password hashing framework with bcrypt and pbkdf2."
arch=('any')
url="http://pypi.python.org/pypi/cryptacular/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/c/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=(fe12232ac660185186dd8057d8ca7b0e)

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1 || return 1
}
