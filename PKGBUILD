# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
pkgname=gameshell
pkgver=0.5.0
pkgrel=1
pkgdesc="A game to learn (or teach) how to use standard commands in a Unix shell"
arch=('any')
url="https://github.com/phyver/GameShell"
license=('GPL3')
depends=('gettext' 'awk')
optdepends=('man-db: extra missions' 'procps-ng: extra missions' 'psmisc: extra missions' 'nano: extra missions' 'tree: extra missions' 'wget: extra missions' 'xorg-xeyes: extra missions' 'util-linux: extra missions')
provides=('gameshell')
source=(
  "gameshell-${pkgver}.sh::${url}/releases/download/v${pkgver}/gameshell.sh"
  "run_gameshell.sh"
)
b2sums=('80ba76569a9746936fa82e0ea849aab450bbdba3f2405af114dd72f43a78c077750430fa68ac3b0a404159c9d16ec3fe3f5d70e9fe353f0fb79ece95136a6261'
        '4efea74d72365dce9c131bf6cd8f7c42ece00072f8a07a1b9e60f95feab6dbf5dd63c434bf37eaab9d90e968d89584fd21e789aa997f1b1d7d1e0b9000bc0001')

package() {
  install -Dm755 "$srcdir/gameshell-${pkgver}.sh" "$pkgdir/opt/gameshell/gameshell.sh"
  install -Dm755 "$srcdir/run_gameshell.sh" "$pkgdir/usr/bin/gameshell"
}
