# Maintainer: Devitzer <defecthorizon@icloud.com>
pkgname=cobalt-lang-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A minimal, fast interpreted programming language. (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/cobalt-lang/cobalt-lang"
license=('GPL-3.0')
depends=('glibc')
conflicts=('cobalt-lang')
provides=('cobalt-lang')
source=("https://github.com/cobalt-lang/cobalt-lang/releases/download/v$pkgver/cobalt-v$pkgver-linux-x86_64.tar.xz")
sha256sums=('42fef1038dde9c6568f6428b02b3679dee0558b6960d0140c7b6cc1e18cfe276')

package() {
	install -Dm755 cobalt -t "$pkgdir/usr/bin/"
	install -Dm755 cobaltc -t "$pkgdir/usr/bin/"
	install -Dm755 cbproj -t "$pkgdir/usr/bin/"
}
