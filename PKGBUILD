# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.37.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('7b13b8d0c14b9cd1699fd5ccc6d09c9b31cec648d11ee0da44bfb156816cd2be')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



