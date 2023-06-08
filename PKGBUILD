# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=pnpm-shell-completion
pkgver=0.5.0
pkgrel=1
pkgdesc='Complete your pnpm command fastly.'
arch=('x86_64')
url='https://github.com/g-plane/pnpm-shell-completion'
license=('MIT')
source=("https://github.com/g-plane/pnpm-shell-completion/releases/download/v$pkgver/pnpm-shell-completion_$arch-unknown-linux-gnu.tar.gz")
sha256sums=('847a07e1d3b87ee41b2e8542b6ce09bc3c35998270ebaf8498f02c89a48b929d')

package() {
  install -Dm755 pnpm-shell-completion $pkgdir/usr/bin/pnpm-shell-completion
  install -Dm755 pnpm-shell-completion.plugin.zsh $pkgdir/usr/share/zsh/plugins/pnpm-shell-completion/pnpm-shell-completion.zsh
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
