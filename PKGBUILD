# Maintainer: Kevin R <rk@rkevin.dev>

pkgname=egctl-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='CLI tool for Envoy Gateway'
arch=('x86_64')
url="https://github.com/envoyproxy/gateway"
license=('Apache-2.0')
source=("https://github.com/envoyproxy/gateway/releases/download/v${pkgver}/egctl_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('3ce349553686bf54a60f1f5bb30f5670474678b67f94c2e4fde8f0d048d0d197')

package() {
    install -m755 -D "bin/linux/amd64/egctl" "$pkgdir/usr/bin/egctl"
}
