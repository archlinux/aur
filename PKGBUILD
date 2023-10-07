# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.41.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('8df0e4250334185b41db3683e41c2a6cf10b51e462d644fa32f1d900ba2c47e3')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



