# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=piper
pkgver=0.1
pkgrel=1
pkgdesc='Piper is a GUI interface to ratbagd, the system daemon for configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/piper'
license=('GPL')
depends=('python' 'python-gobject' 'pygtk' 'ratbagd' 'libratbag')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/libratbag/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('71a471aa083c8017ad6512e59f1644a7356201a63559ec62cbf7c8903bfd7725')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

	python setup.py install --root="${pkgdir}/" --optimize=1
}
