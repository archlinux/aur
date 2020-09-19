# Maintainer: Alexis Janon <kardyne+aur@gmail.com>

_pkgsrcname=tabler-icons
_pkgmaintainer=tabler
_versionprefix=v
pkgver=1.21.0
pkgrel=1
pkgdesc="A set of over 700 icons."
pkgname=ttf-tabler-icons
arch=(any)
url="https://github.com/tabler/tabler-icons"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
md5sums=('598fa034068e117025ebfb67ad7d03fb')

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}/iconfont/fonts"
  install -D -m644 "tabler-icons.ttf" "$pkgdir/usr/share/fonts/TTF/tabler-icons.ttf"
}
