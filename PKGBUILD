# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=pnpm-shell-completion
pkgver=0.2.0
pkgrel=2
pkgdesc='Complete your pnpm command fastly.'
arch=('x86_64')
url='https://github.com/g-plane/pnpm-shell-completion'
license=('MIT')
source=("https://github.com/g-plane/pnpm-shell-completion/releases/download/v$pkgver/pnpm-shell-completion_$arch-unknown-linux-gnu.tar.gz")
sha256sums=('b041b2d2dcc642f6139a3da31fa42ec25afaa4ff940d3ce4d5bfbf8e70c95e86')

package() {
  install -Dm755 pnpm-shell-completion $pkgdir/usr/bin/pnpm-shell-completion
  install -Dm755 pnpm-shell-completion.plugin.zsh $pkgdir/usr/share/zsh/plugins/pnpm-shell-completion.zsh
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
