# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64')
license=('Apache-2.0')
pkgdesc="Fast, multi-platform web server with automatic HTTPS"
pkgname=caddy-bin
pkgrel=1
pkgver=2.1.1
provides=('caddy')
sha256sums_x86_64=('b136df4d25d4c3f7d5efa55c13f1eb586c22cc8bf595641d9b7f9b7cf8fbf401')
source_x86_64=("caddy_x86_64.zip::https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_2.1.1_linux_amd64.tar.gz")
url='https://caddyserver.com'

package() {
  install -D -m755 caddy "$pkgdir/usr/bin/caddy"
}
