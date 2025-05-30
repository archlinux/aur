# Maintainer: Devitzer <defecthorizon@icloud.com>
pkgname=cobalt-lang-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A minimal, fast interpreted programming language. (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/cobalt-lang/cobalt-lang"
license=('GPL-3.0')
depends=('glibc')
conflicts=('cobalt-lang')
provides=('cobalt-lang')
source=("https://github.com/cobalt-lang/cobalt-lang/releases/download/v$pkgver/cobalt-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('e03f83d8bd77d33968da2b206c1e83923408dc17b4ab392dd28a1f3f7ed6292f')

package() {
	install -Dm755 cobalt -t "$pkgdir/usr/bin/"
	install -Dm755 cobaltc -t "$pkgdir/usr/bin/"
	install -Dm755 cbproj -t "$pkgdir/usr/bin/"
}
