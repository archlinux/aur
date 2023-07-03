# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.35.2
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('fc1d5e28a87dcdc3380dae6e1b35b5ed73731f29fe69557df17ba373f82b72fd')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}


