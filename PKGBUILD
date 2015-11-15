# Maintainer: corbie
pkgname=twitch-curses
pkgver=1.0
pkgrel=1
pkgdesc="Terminal-based twitch.tv browser / livestreamer frontend"
arch=('any')
url="https://gitlab.com/corbie/twitch-curses"
license=('WTFPL')
depends=('python' 'livestreamer')
source=('git+https://gitlab.com/corbie/twitch-curses.git')
sha256sums=('SKIP')

package() {
  cd "$srcdir/twitch-curses"
  install -Dm755 twitch-curses.py \
    "${pkgdir}/usr/bin/twitch-curses"
}