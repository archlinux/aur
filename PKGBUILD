# Maintainer: relrel <relrelbachar@gmail.com>
# Contributor: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>
pkgname=closure-compiler
pkgver=20200719
pkgrel=1
pkgdesc="A JavaScript checker and optimizer"
arch=('any')
url="https://developers.google.com/closure/compiler/"
license=('Apache')
depends=(java-runtime)
source=("https://repo.maven.apache.org/maven2/com/google/javascript/$pkgname/v$pkgver/$pkgname-v$pkgver.jar" "$pkgname")
noextract=("$pkgname-v$pkgver.jar")
sha512sums=('12abfa0522cfad62427e990dd3de4de5b31412d67e6ddae35f36de8ba010fa78308b9f62cdbf262b47b3520b8138b0147e778de17abcdd55e4d55344f3f37584'
            '209f7dfca8a3512580f7726edb02e9834dd35b6fd013fffed55c1f1b45555c3445c5251585c2da2dc4c8ca4ba36478a2f737e3e66d786748d7d5d91865705762')

package() {
	install -Dm644 "$srcdir/$pkgname-v$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
}
