# Maintainer: Conrad Haupt <conrad@conradhaupt.com>
# Old-Maintainer: Ghassan Alduraibi <git@ghassan.dev>

_name=hide-keyboard-layout
_uuid=${_name}@sitnik.ru
pkgname=gnome-shell-extension-${_name}
pkgver=10
pkgrel=1
pkgdesc="GNOME Shell extension to hide keyboard layout indicator in status bar."
arch=("any")
url="https://github.com/ai/hide-keyboard-layout"
license=("MIT")
depends=("gnome-shell")
makedepends=("git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('3fb32dece90de5d2b92fea92531b6e3f16abea3c8ca80e4a77dca25949a70ef0f495dfe1e7b285111603c8a61767c78bf80106f8c15e1de594fafb80af0f2847')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/${_name}-${pkgver}" "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}

