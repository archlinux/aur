# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.42.2
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('41bf416b310e2ac7af0d9cd42f72819b1302e5f5b6b863ba12c9aaf8324e74a4')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



