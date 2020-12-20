# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('Apache-2.0')
pkgdesc="Fast, multi-platform web server with automatic HTTPS"
pkgname=caddy-bin
pkgrel=2
pkgver=2.2.1
provides=('caddy')
source_x86_64=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_amd64.tar.gz")
source_arm=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_armv5.tar.gz")
source_armv6h=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5d370234b0bd309a5baec9d9adc9ea391d3dbbf0a1dfe36d4e7eb17e218242ed')
sha256sums_arm=('30e4ecef66345283fb35ced321cc61ac9e0d0cf8586382ca1ed782c7be31478f')
sha256sums_armv6h=('39138528c18457ab458ce38e3d7aac3237ad382a4c4f7fcc82aa96ba16960c5f')
sha256sums_armv7h=('220ef17ccb1cb8d7a3ec74d6cc5013fc4036e9881325aa9e7f1c45dda9d38ea7')
sha256sums_aarch64=('05c5289b0011f87fed9e4ea015c3da61f852b4e196a8da54b232965c664c6a4e')
url='https://caddyserver.com'

package() {
  install -D -m755 caddy "$pkgdir/usr/bin/caddy"
}
