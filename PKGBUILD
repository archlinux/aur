# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=kubebox
pkgver=0.4.0
pkgrel=1
pkgdesc="Kubebox - Terminal and Web console for Kubernetes"
arch=('x86_64')
url="https://github.com/kubernetes/kops"
license=('Apache')
makedepends=()

source=("kubebox-linux-$pkgver::https://github.com/astefanutti/kubebox/releases/download/v${pkgver}/kubebox-linux")
sha1sums=('6c4bd77cb1993933674efb62173bd1d8c9f4ed09')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kubebox-linux-$pkgver" "$pkgdir/usr/bin/kubebox"
}
