# Maintainer: Alone2 <admin@bundr.net>
pkgname=studyflash
pkgver=1.1.2
pkgrel=1
pkgdesc="Learn flashcards inside your terminal"
arch=('any')
url="https://github.com/Alone2/studyFlash"
license=('GPL3')
depends=('python' 'python3' 'vi')
source=("https://github.com/Alone2/studyFlash/archive/v$pkgver.tar.gz")
md5sums=('17e07f18859824eef5c439c9c2648490')

package() {
	cd "${srcdir}/studyFlash-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
