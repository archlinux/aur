# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=piper
pkgver=0.2.1
pkgrel=1
pkgdesc='Piper is a GUI interface to ratbagd, the system daemon for configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/piper'
license=('GPL')
depends=('python' 'python-gobject' 'pygtk' 'ratbagd' 'libratbag')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/libratbag/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d8ec55f1b447daa9712d15a69f645739f7374c5ab8198da2bcd75c4a76cb1375')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

	python setup.py install --root="${pkgdir}/" --optimize=1
}
