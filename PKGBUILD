# Maintainer: Alone2 <admin@bundr.net>
pkgname=studyflash
pkgver=1.0.1
pkgrel=1
pkgdesc="Learn flashcards inside your terminal"
arch=('any')
url="https://github.com/Alone2/studyFlash"
license=('GPL3')
depends=('python' 'python3' 'vi')
source=("https://github.com/Alone2/studyFlash/archive/v$pkgver.tar.gz")
md5sums=('beb13613ff34bea51d65f2cc25d6fcd4')

package() {
	cd "${srcdir}/studyFlash-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
