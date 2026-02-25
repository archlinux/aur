# Maintainer: ftl-tools <https://github.com/ftl-tools/sidebar_tui>
# This file is automatically updated by the release workflow. Do not edit manually.

pkgname=sidebar-tui-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="TUI for managing terminal sessions in a sidebar"
arch=('x86_64' 'aarch64')
url="https://github.com/ftl-tools/sidebar_tui"
license=('MIT')
provides=('sidebar-tui' 'sb')
conflicts=('sidebar-tui')

source_x86_64=("sb-v0.1.12-x86_64-unknown-linux-musl.tar.gz::https://github.com/ftl-tools/sidebar_tui/releases/download/v0.1.12/sb-v0.1.12-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("sb-v0.1.12-aarch64-unknown-linux-musl.tar.gz::https://github.com/ftl-tools/sidebar_tui/releases/download/v0.1.12/sb-v0.1.12-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('c715da68a6097d198c633c7ac4db97cda3e3995fb36584ff0ca7f2c886592956')
sha256sums_aarch64=('9a169e72dfa1f28b86b5d140bcc7c61027bf8bc4afe1b6a3ce8e4277160e51cc')

package() {
  cd "${srcdir}/sb-v0.1.12-${CARCH}-unknown-linux-musl"
  install -Dm755 "sb" "$pkgdir/usr/bin/sb"
}
