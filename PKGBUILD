# Maintainer: Alexis Janon <kardyne -at- gmail -dot- com>

_pkgsrcname=unicons
_pkgmaintainer=iconscout
_versionprefix=v
pkgver=3.0.0
pkgrel=1
pkgdesc="1000+ Pixel-perfect Iconfont."
pkgname=ttf-unicons
arch=(any)
url="https://iconscout.com/unicons"
license=('Apache')
source=("https://github.com/${_pkgmaintainer}/${_pkgsrcname}/releases/download/${_versionprefix}${pkgver}/fonts.zip")
md5sums=('40d0cf6fecde35cb3e38fb4074db46b1')

package() {
  cd "${srcdir}/dist/fonts"
  install -D -m644 "unicons.ttf" "$pkgdir/usr/share/fonts/TTF/unicons.ttf"
}
