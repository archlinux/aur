# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>
pkgname=sentaku
pkgver=0.8.0
pkgrel=1
pkgdesc="Utilily to make sentaku (selection) window with shell command."
arch=('any')
url="https://github.com/rcmdnk/sentaku"
license=('MIT')
depends=()
source=("https://github.com/rcmdnk/sentaku/archive/v${pkgver}.zip")
sha256sums=('cc50d52774fc3ac9dc1520ef1d0b215c92a7fcdc0cfaacb995374a4552975885')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/bin"

  install -D -m755 "./$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share/sentaku"
  install -D -m755 ddv *.sh "$pkgdir/usr/share/sentaku"
}

# vim:set ts=2 sw=2 et:
