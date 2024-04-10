# Maintainer: Cleber Matheus <clebermatheus@outlook.com>

pkgbase=python-pocketlint
pkgname=python-pocketlint
_pkgbase=pocketlint
pkgver=0.25
pkgrel=3
pkgdesc='Addon pylint modules and configuration settings for checking the validity of Python-based source projects.'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/pocketlint'
license=('GPL')
makedepends=('python' 'python-pylint' 'python-packaging' 'python-setuptools')
depends=('python' 'python-pylint' 'python-polib' 'python-packaging')
source=("https://github.com/rhinstaller/pocketlint/archive/${pkgver}.tar.gz")
sha256sums=('d6c868cc6119cfef1470707933a949088a3e1bf82c7375d657f038c728c12fa9')

package () {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=0
}
