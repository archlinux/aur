# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=python2-pysmart
_realname=pySMART
pkgver=0.3
pkgrel=1
pkgdesc='Wrapper for smartctl (smartmontools)'
url='https://pypi.python.org/pypi/pySMART'
license=('GPL2')
depends=('python2' 'smartmontools')
source=("https://pypi.python.org/packages/source/p/pySMART/${_realname}-${pkgver}.zip")
sha256sums=('d4a13d4facc23d8878358994cd355398836a616acc78e285a40d626cecd0817f')
arch=('any')

package() {
	cd "${srcdir}/${_realname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}

