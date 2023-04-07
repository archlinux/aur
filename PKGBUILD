# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=python-pygpgme
pkgver=0.3
pkgrel=10
pkgdesc="A Python interface to the gpgme GnuPG library"
arch=('x86_64')
url='https://launchpad.net/pygpgme'
depends=('python' 'gpgme')
license=('LGPL')
source=("https://launchpad.net/pygpgme/trunk/${pkgver}/+download/pygpgme-${pkgver}.tar.gz")
sha256sums=('5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90449853a3dfb802e1')

package() {
	cd "${srcdir}/pygpgme-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
