# Maintainer: Peter K. Moss <peter@moss.dk>
pkgname=qmarkdown
pkgver=0.2.2
pkgrel=1
pkgdesc="qMarkdown - minimal markdown viewer"
arch=("x86_64")
url="https://github.com/Peterkmoss/qmarkdown"
license=('GPL')
depends=('qt5-base' 'ttf-roboto')
makedepends=('gcc>=9')
provides=('qmarkdown')
source=("https://github.com/Peterkmoss/qmarkdown/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
md5sums=('4f15da5c5b8e784b5abda58cccaf58f2')
