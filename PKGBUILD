# Maintainer: Alexis Janon <kardyne -at- gmail -dot- com>

_pkgsrcname=fluentui-system-icons
_pkgmaintainer=microsoft
pkgver=1.1.60
pkgrel=1
pkgdesc="A collection of familiar, friendly and modern icons from Microsoft."
pkgname=ttf-fluentui-system-icons
arch=(any)
url="https://github.com/microsoft/fluentui-system-icons"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${pkgver}.tar.gz")
md5sums=('b44d156e2b3f9475f492a17d76a3d3c4')

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}/"
  install -d "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 "fonts/FluentSystemIcons-Filled.ttf" "$pkgdir/usr/share/fonts/TTF/FluentSystemIcons-Filled.ttf"
  install -m644 "fonts/FluentSystemIcons-Regular.ttf" "$pkgdir/usr/share/fonts/TTF/FluentSystemIcons-Regular.ttf"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
