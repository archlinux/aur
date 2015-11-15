# Maintainer: corbie
pkgname=twitch-curses
pkgver=1.0
pkgrel=1
pkgdesc="Terminal-based twitch.tv browser / livestreamer frontend"
arch=('any')
url="https://gitlab.com/corbie/twitch-curses"
license=('WTFPL')
depends=('python' 'livestreamer')
source=('https://gitlab.com/corbie/twitch-curses/blob/master/twitch-curses.py')
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  install -Dm755 twitch-curses.py \
    "${pkgdir}/usr/bin/twitch-curses"
}