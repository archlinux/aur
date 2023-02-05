# Maintainer: Ghassan Alduraibi <git@ghassan.dev>

_name=firefox-pip
_uuid=${_name}@bennypowers.com
pkgname=gnome-shell-extension-${_name}
pkgver=3
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="GNOME Shell extension to make Firefox Picture-in-Picture window always on top."
arch=("any")
url="https://github.com/bennypowers/${pkgname}"
license=("GPL3")
depends=("gnome-shell")
makedepends=("git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
b2sums=('24af1f7871acdeb194e41a8666420c9a90a3add8f970fb55df7975b3f990561d77e91a5d2d056bb88bce997e7f6f7203485f09fe87a8338c83a64cdc5a3abad6')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/${pkgname}-${pkgver}" "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}

