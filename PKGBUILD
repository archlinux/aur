# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.62.2
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('740dac84b6a1d17ca4a09cc2ea34232ebc05708ef3b2b9f65462f341dcbcc2cc')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



