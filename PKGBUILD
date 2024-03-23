# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('939eea3e9509ec9228c38a977867feff9123d6fee762ec5f4c94b637ef189fb0')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



