# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.36.1
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('7a185c1a3f86e6a104217ad0a954f59bcd4e05ced585c6413dcabba20952f32e')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



