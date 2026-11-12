# Maintainer: Kevin R <rk@rkevin.dev>

pkgname=egctl-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='CLI tool for Envoy Gateway'
arch=('x86_64')
url="https://github.com/envoyproxy/gateway"
license=('Apache-2.0')
source=("https://github.com/envoyproxy/gateway/releases/download/v${pkgver}/egctl_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('db69030407dc4bcf9384ef5fa91f2c758e506e0dd8250994d4e7ae89a9b5216a')

package() {
    install -m755 -D "bin/linux/amd64/egctl" "$pkgdir/usr/bin/egctl"
}
