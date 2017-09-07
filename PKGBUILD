# Maintainer: Felix Seidel <felix@seidel.me>

pkgname=1password-cli
pkgver=0.1
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('custom')
options=('!strip' '!emptydirs')
source=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_amd64_v$pkgver.zip")
sha256sums=('6e34e161b840c28fdbdefd582d791e1a379b4d7b6b9de54efe94d28603a069b4')

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
