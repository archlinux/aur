# Maintainer: Alone2 <admin@bundr.net>
pkgname=studyflash
pkgver=0.6.0
pkgrel=1
pkgdesc="Learn flashcards inside your terminal"
arch=('any')
url="https://github.com/Alone2/studyFlash"
license=('GPL3')
depends=('python' 'python3' 'vi')
source=("https://github.com/Alone2/studyFlash/archive/v$pkgver.tar.gz")
md5sums=('682318fbb0f1ec9ee337dc7ade05a62e')

package() {
	cd "${srcdir}/studyFlash-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
