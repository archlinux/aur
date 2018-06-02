# Maintainer: quellen <lodgerz@gmail.com>
pkgname=epub2txt
pkgver=0.1.3
pkgrel=1
pkgdesc="Extract text from EPUB documents"
arch=('i686' 'x86_64')
url="https://github.com/kevinboone/epub2txt"
license=('GPL')
source=("http://kevinboone.net/$pkgname-$pkgver.tar.gz")
md5sums=('d5089f654ddccc04a4e280aa7b06b90d')

build() {
	cd "$pkgname"
	make
}

package() {
mkdir -p "$pkgdir/usr/bin"
mkdir -p "$pkgdir/usr/share/man/man1"
cp -p "$srcdir/epub2txt/epub2txt" "$pkgdir/usr/bin/"
install -Dm644 "$srcdir/epub2txt/man1/epub2txt.1" "$pkgdir/usr/share/man/man1/"
} 
