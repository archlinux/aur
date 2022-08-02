# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=xcaddy-bin
pkgver=0.3.0
pkgrel=2
pkgdesc="Build Caddy with plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/caddyserver/xcaddy"
license=('Apache-2.0')
provides=('xcaddy')
conflicts=('xcaddy')
source_x86_64=(
  "https://github.com/caddyserver/xcaddy/releases/download/v${pkgver}/xcaddy_${pkgver}_linux_amd64.tar.gz"
)
source_aarch64=(
  "https://github.com/caddyserver/xcaddy/releases/download/v${pkgver}/xcaddy_${pkgver}_linux_arm64.tar.gz"
)
sha512sums_x86_64=(
  '889b63098037e4641cce5b355bd82535a4b6bbbc4aa16b8214108d0d847d288b52cd19017a477eedc9c066c2ec623310dd7909251888bc9432a7d7553ba9037e'
)
sha512sums_aarch64=(
  '24203b66ed47ba5aaa358a9e84c6a13f48737d8dc2902fdc7e2218409ac1bde9f043f0bbdf7b66697c9f9263cf1272a73784e51a26eca94ff37bcda4c21ece87'
)

package() {
  # Install the executable
  install -d "$pkgdir"/usr/bin/
  install -m 755 xcaddy "$pkgdir"/usr/bin/
}
