# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.36.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('ddb7a9b1ece3ca62f8508dcc024423a18bedf1fe5394161c5eb71ba67d508723')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}


