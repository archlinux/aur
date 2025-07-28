# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=2.31.1
pkgrel=1.3
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('custom')
depends=(libxtst nss mesa alsa-lib)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-2.31.1.deb")
sha256sums=('e65a2e395fe44264deb95052ffdeab347018e94b572ba850182cc78b9360ad79')

package() {
  cd "$srcdir"
  ar x "winamax-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/Winamax/winamax "$pkgdir/usr/bin/winamax"

}



