# Maintainer: vitalie.lazu at gmail dot com

_pkgname=viber
pkgname=$_pkgname-bin
pkgver=7.0.0
pkgrel=1
pkgdesc="Viber for Linux"
arch=("x86_64")
url="http://www.viber.com"
license=("custom")
options=("!strip" "staticlibs")
provides=("$_pkgname" "viber")
# "http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb"
source=(
  "https://github.com/vitaliel/aur-viber-bin/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)

sha256sums=('92822b621843654541bf144ecb77ce727a860521b00afd4acbc6938e3717b71a')

package() {
  _ldir="/usr/share/$_pkgname"
  _pdir="$pkgdir/$_ldir"
  _pexe="$_pdir/$_pkgname"
  tar -xJC "$pkgdir" -f data.tar.xz
  # install -d "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
