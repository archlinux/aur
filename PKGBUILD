# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=pnpm-shell-completion
pkgver=0.2.0
pkgrel=1
pkgdesc='Complete your pnpm command fastly.'
arch=('x86_64')
url='https://github.com/g-plane/pnpm-shell-completion'
license=('MIT')
source=("https://github.com/g-plane/pnpm-shell-completion/releases/download/v$pkgver/pnpm-shell-completion_$arch-unknown-linux-gnu.tar.gz")
sha256sums=('3976a533cc14aeaaec6d105799330fb9e9d2d8f998c8cc3598063c1ce284d8b1')

package() {
  install -Dm755 pnpm-shell-completion $pkgdir/usr/bin/pnpm-shell-completion
  install -Dm755 pnpm-shell-completion.plugin.zsh $pkgdir/usr/share/zsh/plugins/pnpm-shell-completion.zsh
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
