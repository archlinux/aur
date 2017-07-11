# Maintainer: corbie
pkgname=twitch-curses
pkgver=1.2
pkgrel=2
pkgdesc="Terminal-based twitch.tv browser / streamlink frontend"
arch=('any')
url="https://gitlab.com/corbie/twitch-curses"
license=('WTFPL')
depends=('python' 'python-pycurl' 'python-urllib3' 'streamlink')
source=("${pkgname}_${pkgver}-${pkgrel}"::'https://gitlab.com/corbie/twitch-curses/raw/master/twitch-curses.py')
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  install -Dm755 ${pkgname}_${pkgver}-${pkgrel} \
    "${pkgdir}/usr/bin/twitch-curses"
}
