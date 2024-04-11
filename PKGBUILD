# Maintainer: BartSte bartsteensma@outlook.com

pkgname=tmux-session
pkgver=0.1.0
pkgrel=1
pkgdesc="Use fzf to manage your tmux sessions"
arch=('any')
url="https://github.com/BartSte/tmux-session"
license=('MIT')
depends=('fzf' 'tmux')
source=("$pkgname::git+https://github.com/BartSte/tmux-session.git")
md5sums=('SKIP')
changelog="CHANGELOG.md"

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 src/tmux-session "${pkgdir}/usr/local/bin/tmux-session"
}

