# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Prima'
pkgname=cinnamon-theme-${_name,,}
pkgver=20151011
pkgrel=2
pkgdesc="${_name} theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/323"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/SJBR-CC9E-E52Q.zip")
sha256sums=('55dc36b4c752a972385a7f502e6a264d2989a3929297c2f19842814a2cc6cf71')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
