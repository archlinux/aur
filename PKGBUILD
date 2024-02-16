# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.48.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('3346c241bc8c6c1f56109e4607f8377656c69c5fe2fc3f757d805ec443aca0a5')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



