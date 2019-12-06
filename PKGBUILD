# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=kubebox
pkgver=0.7.0
pkgrel=1
pkgdesc="Kubebox - Terminal and Web console for Kubernetes"
arch=('x86_64')
url="https://github.com/astefanutti/kubebox"
license=('Apache')
makedepends=()

source=("kubebox-linux-$pkgver::https://github.com/astefanutti/kubebox/releases/download/v${pkgver}/kubebox-linux")
sha1sums=('c31435f346c951c57b80713d7fa3fba676f885e6')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kubebox-linux-$pkgver" "$pkgdir/usr/bin/kubebox"
}
