# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=kubefedctl
pkgver=0.1.0_rc6
pkgrel=1
pkgdesc="Kubernetes Cluster Federation (kubefed)"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kubefed"
license=('Apache')
makedepends=()

source=("kubefedctl-linux-amd64-$pkgver::https://github.com/kubernetes-sigs/kubefed/releases/download/v${pkgver/_/-}/kubefedctl-${pkgver/_/-}-linux-amd64.tgz")
sha256sums=('19e64b6cd9708314648972143ea23522d449de655e737e1aa27a441ade481025')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kubefedctl" "$pkgdir/usr/bin/kubefedctl"
}
