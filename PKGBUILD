# Maintainer: aNNiMON <annimon119 at gmail dot com>

pkgname=ownlang
pkgver=1.4.0
pkgrel=2
pkgdesc="A scripting functional programming language with dynamic typing"
arch=('any')
url="http://projects.annimon.com/projects/ownlang"
license=('MIT')
depends=('java-runtime>=8')
optdepends=('java-openjfx: for canvasfx module')
source=("https://annimon.com/aur/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('176267b17c7cae0bf8de7c06e1090155f56cb064e4f80a4a6b985eff847f4462')
sha512sums=('d0bc6857bc456474d5434b12e15a14a989cfe6daf47d8db906f2aa03b6a1fb5e2e04176a1d24c7ba8f971051de9cc50305300fe694095ffd0fa201d381768853')

package() {
	install -Dm644 "$srcdir/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
