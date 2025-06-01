# Maintainer: Devitzer <defecthorizon@icloud.com>
pkgname=cobalt-lang-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A minimal, fast interpreted programming language. (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/cobalt-lang/cobalt-lang"
license=('GPL-3.0')
depends=('glibc')
conflicts=('cobalt-lang')
provides=('cobalt-lang')
source=("https://github.com/cobalt-lang/cobalt-lang/releases/download/v$pkgver/cobalt-v$pkgver-linux-x86_64.tar.xz")
sha256sums=('2d222d1ccf9d81a706e113c2ab922861a1cf639930fb01957aad97ebcb5af3e9')

package() {
	install -Dm755 cobalt -t "$pkgdir/usr/bin/"
	install -Dm755 cobaltc -t "$pkgdir/usr/bin/"
	install -Dm755 cbproj -t "$pkgdir/usr/bin/"
}
