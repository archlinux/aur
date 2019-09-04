# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=kubebox
pkgver=0.6.0
pkgrel=1
pkgdesc="Kubebox - Terminal and Web console for Kubernetes"
arch=('x86_64')
url="https://github.com/astefanutti/kubebox"
license=('Apache')
makedepends=()

source=("kubebox-linux-$pkgver::https://github.com/astefanutti/kubebox/releases/download/v${pkgver}/kubebox-linux")
sha1sums=('97a91532db51a26b21cc7dec76c43f5d0b9aeb83')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kubebox-linux-$pkgver" "$pkgdir/usr/bin/kubebox"
}
