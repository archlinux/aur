# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=xcaddy-bin
pkgver=0.4.2
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
sha512sums_x86_64=(
  'a726e4b7992f3c6c11c585b6100f796f035c6757d247110c6af9bb4f218b7ec67d07db0013c6834e9b881582d75ba4fe8e78f6ca5883b1017da6b5407d1ca25c'
)
sha512sums_aarch64=(
  '41033dc721e799583eac2014b6e409d65a704d0a4360c131662aa651e7fbd129dce03c460661a51e0ba192d27fb3af19faa054da8c037c642b24a12124f6d4a8'
)

package() {
  # Install the executable
  install -d "$pkgdir"/usr/bin/
  install -m 755 xcaddy "$pkgdir"/usr/bin/
}
