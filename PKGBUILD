# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.51.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('d00ed1e51e5895bf43d77c9ac024612e961a97136e1d80d893ba5b54ed46d98c')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



