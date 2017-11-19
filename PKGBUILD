# Maintainer: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kops
pkgver=1.7.1
pkgrel=1
pkgdesc="Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
arch=('x86_64')
url="https://github.com/kubernetes/kops"
license=('Apache')
makedepends=()

source=("kops-linux-amd64-$pkgver::https://github.com/kubernetes/kops/releases/download/${pkgver}/kops-linux-amd64")
sha512sums=('10267466a3dd37098480d34d267319fca201e3af58e41f65786b96699d2767074df3043350501d6178c6c1834eddd45384c3807e9d459fd9f07bdc7084983214')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kops-linux-amd64-$pkgver" "$pkgdir/usr/bin/kops"
}
