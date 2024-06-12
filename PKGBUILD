# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.62.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('10878f77700d6e901ec82f2d393ec4f7695e94f1b0fae4f7f15d5ece60ed75b9')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



