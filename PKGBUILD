# Maintainer: Devitzer <defecthorizon@icloud.com>
pkgname=cobalt-lang-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="A minimal, fast interpreted programming language. (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/cobalt-lang/cobalt-lang"
license=('GPL-3.0')
depends=('glibc')
conflicts=('cobalt-lang')
provides=('cobalt-lang')
source=("https://github.com/cobalt-lang/cobalt-lang/releases/download/v$pkgver/cobalt-v$pkgver-linux-x86_64.tar.xz")
sha256sums=('b92383f413aee8fba16d91a62a43e9a7b915b9250f459b56e65905ea9dd799b7')

package() {
	install -Dm755 cobalt -t "$pkgdir/usr/bin/"
	install -Dm755 cobaltc -t "$pkgdir/usr/bin/"
	install -Dm755 cbproj -t "$pkgdir/usr/bin/"
}
