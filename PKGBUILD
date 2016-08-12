# Maintainer: corbie
pkgname=twitch-curses
pkgver=1.1
pkgrel=1
pkgdesc="Terminal-based twitch.tv browser / livestreamer frontend"
arch=('any')
url="https://gitlab.com/corbie/twitch-curses"
license=('WTFPL')
depends=('python' 'python-pycurl' 'python-urllib3' 'livestreamer')
source=("${pkgname}_${pkgver}-${pkgrel}"::'https://gitlab.com/corbie/twitch-curses/raw/master/twitch-curses.py')
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  install -Dm755 ${pkgname}_${pkgver}-${pkgrel} \
    "${pkgdir}/usr/bin/twitch-curses"
}
