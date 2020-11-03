# Maintainer: Peter K. Moss <peter@moss.dk>
pkgname=qmarkdown
pkgver=0.2.1
pkgrel=1
pkgdesc="qMarkdown - minimal markdown viewer"
arch=("x86_64")
url="https://github.com/Peterkmoss/qMarkdown"
license=('GPL')
depends=('qt5-base')
makedepends=('gcc>=9')
provides=('qmarkdown')
source=("https://github.com/Peterkmoss/qMarkdown/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
md5sums=('e01b9d2f283e3ccc037c9d5dded1f710')
