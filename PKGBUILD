# Maintainer: Andre Kugland <kugland@gmail.com>

pkgname="python-srt"
_pkgname="srt"
pkgver=3.3.0
pkgrel=2
pkgdesc='A tiny library for parsing, modifying, and composing SRT files'
arch=('any')
url="https://pypi.org/project/$_pkgname/$pkgver"
license=('MIT')
provides=('python-srt')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ef20ebddaa195bb75d61eb1893373cc62da0658218ddac6c5652d28938b20663')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
