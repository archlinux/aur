pkgname=kernel-chktaint
pkgver=5.8.9
pkgrel=1
pkgdesc="Check kernel for tainted modules"
arch=("any")
license=('GPL')
_version=5
source=("https://cdn.kernel.org/pub/linux/kernel/v$_version.x/linux-"$pkgver".tar.xz")
sha256sums=("99d8bc1b82f17d7d79f9af4a94af4c0e3772159e9e6e278761bde8569f93e15f")

package() {
	mkdir -p "$pkgdir"/usr/bin
	cp linux-"$pkgver"/tools/debugging/kernel-chktaint "$pkgdir"/usr/bin
}
