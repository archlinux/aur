# Maintainer: Kevin R <rk@rkevin.dev>

pkgname=egctl-bin
pkgver=1.8.1
pkgrel=1
pkgdesc='CLI tool for Envoy Gateway'
arch=('x86_64')
url="https://github.com/envoyproxy/gateway"
license=('Apache-2.0')
source=("https://github.com/envoyproxy/gateway/releases/download/v${pkgver}/egctl_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('e904e648a3a40b133d20e17fd98e514e2bb2b8cda0c9923bc4c5004da5cc4ee5')

package() {
    install -m755 -D "bin/linux/amd64/egctl" "$pkgdir/usr/bin/egctl"
}
