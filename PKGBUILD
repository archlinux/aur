# Maintainer: Felix Seidel <felix@seidel.me>

pkgname=1password-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('custom')
options=('!strip' '!emptydirs')
source=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_amd64_v$pkgver.zip")
sha256sums=('6dc01dce5138f5ec8c6d6853fb22d02cfe1c0b0178f02754278d4dcac11f038b')

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
