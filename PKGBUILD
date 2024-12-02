# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=2.5.3
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('0a9982b48bb26b759386bc9501338e0fd32f4cda687edeac1bbac7444cfa2322')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



