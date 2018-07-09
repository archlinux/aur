# Maintainer: aNNiMON <annimon119 at gmail dot com>

pkgname=ownlang
pkgver=1.3.1
pkgrel=1
pkgdesc="A scripting functional programming language with dynamic typing"
arch=('any')
url="http://projects.annimon.com/projects/ownlang"
license=('MIT')
depends=('java-runtime>=8')
optdepends=('java-openjfx: for canvasfx module')
source=("https://annimon.com/aur/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8bf1700bde2f7c632c0448c065cea980e8ea0e3564b5bca1eb7e0313fd2c0125')
sha512sums=('d2d4df04b1027fb70a0fd9a14826b830ecdf7b0a8b16b3c292e1d65f822e68516a4a70bf8e7f98da910dc108b5e4c2e1da67146423a00f3c086f49b609f1dde6')

package() {
	install -Dm644 "$srcdir/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
