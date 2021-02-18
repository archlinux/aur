# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=xcaddy-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Build Caddy with plugins"
arch=('x86_64')
url="https://github.com/caddyserver/xcaddy"
license=('Apache-2.0')
provides=('xcaddy')
conflicts=('xcaddy')
source=(
  "https://github.com/caddyserver/xcaddy/releases/download/v${pkgver}/xcaddy_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=(
  '7874c0574cbb045dffa2fb3f7741872d08fd6916f4b3e39255c111698993018f'
)

package() {
  # Install the executable
  install -d "$pkgdir"/usr/bin/
  install -m 755 xcaddy "$pkgdir"/usr/bin/
}
