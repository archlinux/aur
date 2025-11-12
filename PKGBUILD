# Maintainer: Kevin R <rk@rkevin.dev>

pkgname=egctl-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='CLI tool for Envoy Gateway'
arch=('x86_64')
url="https://github.com/envoyproxy/gateway"
license=('Apache-2.0')
source=("https://github.com/envoyproxy/gateway/releases/download/v${pkgver}/egctl_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('9ba27d33c520841871fe28f98b288c513b9555efff4c66fe25c45899e915d8b1')

package() {
    install -m755 -D "bin/linux/amd64/egctl" "$pkgdir/usr/bin/egctl"
}
