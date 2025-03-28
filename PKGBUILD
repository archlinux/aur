# Maintainer: envolution
# Contributor: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=gameshell
pkgver=0.6.0
pkgrel=1
pkgdesc="A game to learn (or teach) how to use standard commands in a Unix shell"
arch=('any')
url="https://github.com/phyver/GameShell"
license=('GPL-3.0-only')
depends=('gettext' 'awk')
optdepends=('man-db: extra missions' 'procps-ng: extra missions' 'psmisc: extra missions' 'nano: extra missions' 'tree: extra missions' 'wget: extra missions' 'xorg-xeyes: extra missions' 'util-linux: extra missions')
provides=('gameshell')
source=(
  "gameshell-${pkgver}.sh::${url}/releases/download/v${pkgver}/gameshell.sh"
  "run_gameshell.sh"
)
b2sums=('9f1664719d16f6405dddfb7f3fe7f3041cbf67e95d5c11cf58ae1eab8446513d75007f16db678e05f886f628941775d17cfcb4aeeb28351ca77f4fe5ef28d21e'
        'f8863d28f5ce629f6aaa53b8b4dd0477991896b77e4eec318c4c75e70a7db1b69616b1e8d3ad7b4ba7f2385dcab8fdbe2537e3d2c4abc8f29d2bffcdb3e170b7')

package() {
  install -Dm755 "$srcdir/gameshell-${pkgver}.sh" "$pkgdir/opt/gameshell/gameshell.sh"
  install -Dm755 "$srcdir/run_gameshell.sh" "$pkgdir/usr/bin/gameshell"
}
# vim:set ts=2 sw=2 et:
