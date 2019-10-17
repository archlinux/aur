# Maintainer: aNNiMON <annimon119 at gmail dot com>

pkgname=ownlang
pkgver=1.5.0
pkgrel=3
pkgdesc="A scripting functional programming language with dynamic typing"
arch=('any')
url="http://projects.annimon.com/projects/ownlang"
license=('MIT')
depends=('java-runtime>=8')
optdepends=('java-openjfx: for canvasfx module')
source=("https://annimon.com/aur/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c10b67e40e7d13d49247b315ff5752bf83a85feec18f23090fc6ed7a2010d458')
sha512sums=('33866271343b6cac0fc4abc8a12c12f74404a61f8370c21bfa05098a90e47a0537418708be1b8a259cbf1a87b305dd7396a6f6e9b0ce3466af73c03e660340bc')

package() {
	install -Dm644 "$srcdir/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
