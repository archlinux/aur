# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=xcaddy-bin
pkgver=0.4.4
pkgrel=1
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
  'ae36b87c7edf8008479726efd739efbc20d95968086cdf176e78e1a4a8195e23'
)
sha256sums_aarch64=(
  '805a78361fc2e91dbed11f19eb7833be42ee393b10c9be5887d30d9fd6ea17de'
)

package() {
  # Install the executable
  install -d "$pkgdir"/usr/bin/
  install -m 755 xcaddy "$pkgdir"/usr/bin/
}
