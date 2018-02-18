# Maintainer: renyuneyun <renyuneyun@gmail.com>

_pkgname=sddm-chinese-painting-theme
pkgname=${_pkgname}-git
_commit=e50f5f9
pkgver=0.1.1.${_commit}
pkgrel=1
pkgdesc="Chinese style SDDM theme (git version)"
arch=('any')
url="https://github.com/fralonra/sddm-chinese-painting-theme"
license=('GPL3')
depends=('sddm' 'qt5-graphicaleffects')
source=("git+https://github.com/fralonra/${_pkgname}#commit=${_commit}")
md5sums=('SKIP')

package() {
  cd "$srcdir/${_pkgname}"

  mkdir -p $pkgdir/usr/share/sddm/themes/

  cp -r chinese-painting/ $pkgdir/usr/share/sddm/themes/
}
