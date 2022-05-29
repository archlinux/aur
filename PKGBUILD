# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
pkgname=gameshell
pkgver=0.3.1
pkgrel=1
pkgdesc="A game to learn (or teach) how to use standard commands in a Unix shell"
arch=('any')
url="https://github.com/phyver/GameShell"
license=('GPL3')
depends=('gettext' 'man-db' 'procps' 'psmisc' 'nano' 'tree' 'wget' 'xorg-xeyes' 'util-linux')
provides=('gameshell')
source=(
  "gameshell-${pkgver}.sh::${url}/releases/download/v${pkgver}/gameshell.sh"
  "run_gameshell.sh"
)
b2sums=(
  'eda4a17c3376ca61c900d3fcf1431d1608221fe7d2179ec9ab03204dd23e4664c1a710e4b64ad0aa85a337b81c2b6dee2d34a70b2191e3f9afd30c3db1c0733c'
  '4efea74d72365dce9c131bf6cd8f7c42ece00072f8a07a1b9e60f95feab6dbf5dd63c434bf37eaab9d90e968d89584fd21e789aa997f1b1d7d1e0b9000bc0001'
)

package() {
  install -Dm755 "$srcdir/gameshell-${pkgver}.sh" "$pkgdir/opt/gameshell/gameshell.sh"
  install -Dm755 "$srcdir/run_gameshell.sh" "$pkgdir/usr/bin/gameshell"
}
