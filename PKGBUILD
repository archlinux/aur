# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.33.2
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('1779c1bcfad6bea39886b33995ba039dd50ba16e7c2245390e87adcd0ca73ebd')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}


