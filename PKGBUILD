# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.27.2
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64 aarch64 armv7h)
url="https://caido.io/"
license=('private')
depends=(gcc-libs glibc)
provides=(caido)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-linux-v${pkgver}-cfdfff99.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-linux-aarch64-v${pkgver}-dbac2550.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-linux-armv7-v${pkgver}-d0a844e9.tar.gz")
sha256sums_x86_64=('cfdfff999f15d7efd83b2295d5424d21b7de7d4f1e3c93633b06f8b83e65be0c')
sha256sums_aarch64=('dbac25502c760d9c1a640cafb45200b5ab4971685270725b69b5c1a80b94ece9')
sha256sums_armv7h=('d0a844e9e2126b4f3a4d57fbf209cdb56349898318466795b8d4f1e54b5aac27')

package() {
	install -Dm755 caido -t $pkgdir/usr/bin
}
