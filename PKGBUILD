# Maintainer: Devitzer <defecthorizon@icloud.com>
pkgname=cobalt-lang-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A minimal, fast interpreted programming language. (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/cobalt-lang/cobalt-lang"
license=('GPL-3.0')
depends=('glibc')
conflicts=('cobalt-lang')
provides=('cobalt-lang')
source=("https://github.com/cobalt-lang/cobalt-lang/releases/download/v$pkgver/cobalt-v$pkgver-linux-x86_64.tar.xz")
sha256sums=('ae3c2de3f6e0c8147669d9d00e1fcad8a6e16089d01aefb8d42317c7785137b3')

package() {
	install -Dm755 cobalt -t "$pkgdir/usr/bin/"
	install -Dm755 cobaltc -t "$pkgdir/usr/bin/"
	install -Dm755 cbproj -t "$pkgdir/usr/bin/"
}
