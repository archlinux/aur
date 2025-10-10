# Maintainer: Cleber Matheus <clebermatheus@outlook.com>

pkgbase=python-pocketlint
pkgname=python-pocketlint
_pkgbase=pocketlint
pkgver=0.26
pkgrel=1
pkgdesc='Addon pylint modules and configuration settings for checking the validity of Python-based source projects.'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/pocketlint'
license=('GPL')
makedepends=('python' 'python-pylint' 'python-packaging' 'python-setuptools')
depends=('python' 'python-pylint' 'python-polib' 'python-packaging')
source=("https://github.com/rhinstaller/pocketlint/archive/${pkgver}.tar.gz")
sha256sums=('1df02bdeb0a31914da16c3e0f125d8f25ff5506287a0c89b51207f8e620f28d0')

package () {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=0
}
