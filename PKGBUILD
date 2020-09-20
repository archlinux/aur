# Maintainer: Alexis Janon <kardyne -at- gmail -dot- com>

_pkgsrcname=RemixIcon
_pkgmaintainer=remix-design
_versionprefix=v
pkgver=2.5.0
pkgrel=1
pkgdesc=" Open source neutral style icon system"
pkgname=ttf-remixicon
arch=(any)
url="https://remixicon.com/"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
md5sums=('75e497771e8797358bfaa1605050a785')

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}/fonts"
  install -D -m644 "remixicon.ttf" "$pkgdir/usr/share/fonts/TTF/remixicon.ttf"
}
