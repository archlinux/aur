# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=xcaddy-bin
pkgver=0.2.0
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
sha256sums_x86_64=(
  '413d79636ea07f05e52ea26976e5224df47eff2634555b47f1cb867fba35dac6'
)
sha256sums_aarch64=(
  'a63211f96a0618252920b8622a51404dd406c659e64d407cb7bd96de6cb1eea7'
)

package() {
  # Install the executable
  install -d "$pkgdir"/usr/bin/
  install -m 755 xcaddy "$pkgdir"/usr/bin/
}
