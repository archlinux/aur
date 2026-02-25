# Maintainer: ftl-tools <https://github.com/ftl-tools/sidebar_tui>
# This file is automatically updated by the release workflow. Do not edit manually.

pkgname=sidebar-tui-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="TUI for managing terminal sessions in a sidebar"
arch=('x86_64' 'aarch64')
url="https://github.com/ftl-tools/sidebar_tui"
license=('MIT')
provides=('sidebar-tui' 'sb')
conflicts=('sidebar-tui')

source_x86_64=("sb-v0.1.13-x86_64-unknown-linux-musl.tar.gz::https://github.com/ftl-tools/sidebar_tui/releases/download/v0.1.13/sb-v0.1.13-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("sb-v0.1.13-aarch64-unknown-linux-musl.tar.gz::https://github.com/ftl-tools/sidebar_tui/releases/download/v0.1.13/sb-v0.1.13-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('9edba77f38be44abb3860c482a7a118b90469dee9ee7de45b8f7ee60768d076d')
sha256sums_aarch64=('13a6f2bfd6890509b671885e86e5f32f1319b9459bdd584249b33949f60df0da')

package() {
  cd "${srcdir}/sb-v0.1.13-${CARCH}-unknown-linux-musl"
  install -Dm755 "sb" "$pkgdir/usr/bin/sb"
}
