# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.55.1
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('d0f0ad72c6f866f65a38e0b9fe6ab4478ae64d82cfe5954cb3af1f02be4ddb7c')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



