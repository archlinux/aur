# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Prima'
pkgname=cinnamon-theme-${_name,,}
pkgver=20150707
pkgrel=1
pkgdesc="${_name} theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/323"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/UFUM-G172-07QS.zip")
sha256sums=('532ecd03ecff37b596508eb0d0fefc968b6b2d2bd9eab3af0f84544edacffa49')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
