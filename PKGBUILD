# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.35.1
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('f07f99fdb812f2f9dc0c5fc54666469a22bf2d0cbfe94b13469d083ead3d8716')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}


