# Maintainer: Ghassan Alduraibi <git@ghassan.dev>

_name=firefox-pip
_uuid=${_name}@bennypowers.com
pkgname=gnome-shell-extension-${_name}
pkgver=4
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="GNOME Shell extension to make Firefox Picture-in-Picture window always on top."
arch=("any")
url="https://github.com/bennypowers/${pkgname}"
license=("GPL3")
depends=("gnome-shell")
makedepends=("git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
b2sums=('d408727e21cdbd606488b99458bcbd157ae368f75a0ad50f402c2afcb118209deb3f2935b40432a16926fa91bd0db0322c2114ad61f7b4d857a0a9c789834cb0')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/${pkgname}-${pkgver}" "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}

