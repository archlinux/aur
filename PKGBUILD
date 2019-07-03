# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=kubefedctl
pkgver=0.1.0_rc3
pkgrel=1
pkgdesc="Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kubefed"
license=('Apache')
makedepends=()

source=("kubefedctl-linux-amd64-$pkgver::https://github.com/kubernetes-sigs/kubefed/releases/download/v${pkgver/_/-}/kubefedctl-${pkgver/_/-}-linux-amd64.tgz")
sha256sums=('895ad4c603a729c1ce74b302e05f3aca84f42ccaa44975ca9faf3638e3360ddc')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kubefedctl" "$pkgdir/usr/bin/kubefedctl"
}
