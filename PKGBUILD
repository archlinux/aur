# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>
pkgname=sentaku
pkgver=0.5.5
pkgrel=1
pkgdesc="Utilily to make sentaku (selection) window with shell command."
arch=('any')
url="https://github.com/rcmdnk/sentaku"
license=('MIT')
depends=()
source=("https://github.com/rcmdnk/sentaku/archive/v${pkgver}.zip")
md5sums=('70b68552ce0c0d8277eea6be1f2c880d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/bin"

  install -D -m755 "./$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share/sentaku"
  install -D -m755 ddv *.sh "$pkgdir/usr/share/sentaku"
}

# vim:set ts=2 sw=2 et:
