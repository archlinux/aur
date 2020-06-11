# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=1.1.1
pkgrel=1
pkgdesc='Turbo Diary - A Personal Diary'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/turbodiary'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('7f2e506f8448694acc680f37e6fec5dd85eed7b936ec486362ad477417ae25c4')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
