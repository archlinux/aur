# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.33.1
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('2c01fc0957345a80cd32d26f1f068cc68368aaf2777fbf9e96a75e91b84db1ae')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}


