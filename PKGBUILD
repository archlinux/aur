# Maintainer: markzz <mark dot weiman at markzz dot com>
# Contributor: ShadowKyogre <shadowkyogre@aim.com>

pkgname=ttf-optimusprinceps
pkgver=1.0
pkgrel=1
pkgdesc="Optimus Princeps font by Manfred Klein"
arch=('any')
url="http://www.dafont.com/optimusprinceps.font"
license=('custom')
makedepends=('unzip')
depends=(fontconfig xorg-font-utils)
source=("optimusprinceps.zip::http://img.dafont.com/dl/?f=optimusprinceps")
md5sums=('42b921226539e25d43e48bef2d19a816')
install=$pkgname.install

package() {
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  
  install -m644 "$srcdir/OptimusPrinceps.ttf" "$pkgdir/usr/share/fonts/TTF/OptimusPrinceps.ttf"
  install -m644 "$srcdir/OptimusPrincepsSemiBold.ttf" "$pkgdir/usr/share/fonts/TTF/OptimusPrincepsSemiBold.ttf"
}

# vim:set ts=2 sw=2 et:
