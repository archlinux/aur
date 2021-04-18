# Maintainer: nitsky
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('Apache-2.0')
pkgdesc="Fast, multi-platform web server with automatic HTTPS"
pkgname=caddy-bin
pkgrel=1
pkgver=2.3.0
provides=('caddy')
source_x86_64=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_amd64.tar.gz")
source_arm=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_armv5.tar.gz")
source_armv6h=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1579374e8913a225ea029843d246ecbbe5e9730444f8d35a96849af1fa2ad049')
sha256sums_arm=('ef825dbbb28f2081dd82b8b8cf7fadafc62c7cca9839d75ca3bfde075a22df70')
sha256sums_armv6h=('af0181a410f7af1b0466c3b41c31e312f180bcd90d4ed4f3d94c478f21c806d2')
sha256sums_armv7h=('54760ced9b9a993f00c16bfdece7ac468c215f66f77f1ed8ac1c90e13992f73a')
sha256sums_aarch64=('95176dd77355c3d36d64303d40947d164b130ecacc6d8a8ad65ff18b527469d7')
url='https://caddyserver.com'

package() {
  install -D -m 755 caddy "$pkgdir/usr/bin/caddy"
}
