# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('Apache-2.0')
pkgdesc="Fast, multi-platform web server with automatic HTTPS"
pkgname=caddy-bin
pkgrel=1
pkgver=2.2.0
provides=('caddy')
source_x86_64=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_amd64.tar.gz")
source_arm=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_armv5.tar.gz")
source_armv6h=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('989cfd637872e0b6169712b4a76ec230f386c18f97585982a99e9b42f6acf048')
sha256sums_arm=('4ffa5916ce47ec5a6c851f7865ee766275aae7ec11935a4eb04e8e4f4c9e0042')
sha256sums_armv6h=('4e79608c8cf8fbcff87ad893f8338bab194b9ff4b3fcc8b1a7082da8108813be')
sha256sums_armv7h=('3a075b70934015d5808e8f250338e6637099fc06e871b48c21f9bf7edd0961c3')
sha256sums_aarch64=('f4891656a4f75117e5dda26d009d4a75d218eef5c9302fd34a098b2f8c9bd196')
url='https://caddyserver.com'

package() {
  install -D -m755 caddy "$pkgdir/usr/bin/caddy"
}
