# Maintainer: Andre Kugland <kugland@gmail.com>

pkgname="python-srt"
_pkgname="srt"
pkgver=3.0.0
pkgrel=1
pkgdesc='A tiny library for parsing, modifying, and composing SRT files'
arch=('any')
url="https://pypi.org/project/$_pkgname/$pkgver"
license=('MIT')
provides=('python-srt')
source=("https://files.pythonhosted.org/packages/c4/bb/ab238cb0650efc544c26e63c00166db186e997c03b32eab4ad2b93a29ff2/$_pkgname-$pkgver.tar.gz")
sha256sums=('deed9a52b1f1bc2c290f0de49c2204a892952d972a2a08bc5a08861e240a05c2')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
