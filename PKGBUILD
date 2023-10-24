# Maintainer: Senderman <doletov.fyodor@yandex.ru>
pkgname=sse-file-pc
pkgver=15.0.6
pkgrel=1
pkgdesc="Cross-platform java tool for file encryption"
arch=('any')
url="https://paranoiaworks.mobi/"
license=('Apache' 'MIT')
depends=('java-runtime>=8')
source=("https://paranoiaworks.mobi/download/files/SSEFilePC.zip"
"icon.png"
"sse.desktop"
)
md5sums=('2c48dd62e18ee96eb94e7be059681cc9'
         'fea7ed69540dfd37adbb7080a8fee6ce'
         '538207e344240dfe9d773c17593d3e1f')
package() {
	install -Dm0644 $srcdir/SSEFilePC/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
	install -Dm0644 $srcdir/SSEFilePC/ssefenc.jar $pkgdir/opt/$pkgname/ssefenc.jar
	install -Dm0644 $srcdir/SSEFilePC/ssefencgui.jar $pkgdir/opt/$pkgname/ssefencgui.jar
	install -Dm0644 $srcdir/icon.png $pkgdir/opt/$pkgname/icon.png
	install -Dm0755 $srcdir/sse.desktop $pkgdir/usr/share/applications/sse.desktop
}
