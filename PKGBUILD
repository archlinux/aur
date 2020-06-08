# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=1.1.0
pkgrel=1
pkgdesc='Turbo Diary - A Personal Diary'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/turbodiary'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('c146f66d227b1f67c51c446360965a46e04f1be368c5e453fbdbcf6c748b39bb')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
