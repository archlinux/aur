# Maintainer: Peter K. Moss <peter@moss.dk>
pkgname=qmarkdown
pkgver=0.3.1
pkgrel=1
pkgdesc="qMarkdown - minimal markdown viewer"
arch=("x86_64")
url="https://github.com/Peterkmoss/qmarkdown"
license=('GPL')
depends=('qt5-base')
optdepends=('ttf-roboto')
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
md5sums=('37af849cf6952bf170c967763e32153b')
md5sums=('37af849cf6952bf170c967763e32153b')
md5sums=('37af849cf6952bf170c967763e32153b')
md5sums=('37af849cf6952bf170c967763e32153b')
