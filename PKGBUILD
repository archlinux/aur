# Maintainer: Senderman <doletov.fyodor@yandex.ru>
pkgname=sse-file-pc
pkgver=12RF3Fc
pkgrel=1
pkgdesc="File encryption"
arch=('any')
url="https://paranoiaworks.mobi/"
license=('Apache' 'MIT')
depends=('java-runtime>=8')
source=("SSEFilePC::http://my-files.ru/Save/8rr439"
"http://my-files.ru/Save/f7skdx/icon.png"
"http://my-files.ru/Save/i5rsez/sse.desktop"
)
md5sums=('SKIP' 'SKIP' 'SKIP')
package() {
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/opt/$pkgname
	install -Dm0644 $srcdir/SSEFilePC/license.txt $pkgdir/usr/share/licenses/$pkgname
	install -Dm0666 $srcdir/SSEFilePC/*.jar icon.png $pkgdir/opt/$pkgname
	install -Dm0755 $srcdir/sse.desktop $pkgdir/usr/share/applications
}
