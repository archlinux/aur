# Maintainer: Alone2 <admin@bundr.net>
pkgname=studyflash
pkgver=0.5.3
pkgrel=1
pkgdesc="Learn flashcards inside your terminal"
arch=('any')
url="https://github.com/Alone2/studyFlash"
license=('GPL3')
depends=('python' 'python3' 'python-pip')
source=("https://github.com/Alone2/studyFlash/archive/v$pkgver.tar.gz")
md5sums=('ebdc26f0195e8b8b50bff3580a206e0a')

package() {
	cd "${srcdir}/studyFlash-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
