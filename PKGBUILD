# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=xcaddy-bin
pkgver=0.4.0
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
  'bd3f08b2fe678b877a3ba23c8801749c513f066f8c2f8fdcfb74cb0cf305a0063e268f44c407eb614b6157d09357913428462153d16b969a2828c1998872b994'
)
sha512sums_aarch64=(
  'b730a207efed951846ee322755c16042cc8135a4b3ae10bb550e3801306b3811b75a72f4dfbfdb2bbe38d4247ce30d52051ca85277abafeb50616f6387e6cb58'
)

package() {
  # Install the executable
  install -d "$pkgdir"/usr/bin/
  install -m 755 xcaddy "$pkgdir"/usr/bin/
}
