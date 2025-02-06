pkgname=csvparse
pkgver=1.0
pkgrel=1
pkgdesc="Автоматизированный обработчик CSV файлов"
arch=(x86_64)
url=""
license=('MIT')
depends=('gcc')
source=("script.cpp")
md5sums=('SKIP')

build(){
	cd "$srcdir"
	g++ script.cpp -o csvparse
}

package() {
	cd "$srcdir"
	install -Dm755 csvparse "$pkgdir/usr/bin/csvparse"
}

