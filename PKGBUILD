# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=2.21.0
pkgrel=1.2
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-2.21.0.deb")
sha256sums=('dc7608e9099cb606751cc683778b8b8ab89cf7c94bfde97ce287799de21c97dc')

package() {
  cd "$srcdir"
  ar x "winamax-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
}



