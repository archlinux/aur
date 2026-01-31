# Maintainer: Kevin R <rk@rkevin.dev>

pkgname=egctl-bin
pkgver=1.6.3
pkgrel=1
pkgdesc='CLI tool for Envoy Gateway'
arch=('x86_64')
url="https://github.com/envoyproxy/gateway"
license=('Apache-2.0')
source=("https://github.com/envoyproxy/gateway/releases/download/v${pkgver}/egctl_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('2b18d2fc48fe06d37433616324a7a9f8d50661f79d84ab1e3001e36dab13674a')

package() {
    install -m755 -D "bin/linux/amd64/egctl" "$pkgdir/usr/bin/egctl"
}
