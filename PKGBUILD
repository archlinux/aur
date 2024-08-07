# Maintainer: Ghassan Alduraibi <git@ghassan.dev>

_name=hide-keyboard-layout
_uuid=${_name}@sitnik.ru
pkgname=gnome-shell-extension-${_name}
pkgver=8
pkgrel=1
pkgdesc="GNOME Shell extension to hide keyboard layout indicator in status bar."
arch=("any")
url="https://github.com/ai/hide-keyboard-layout"
license=("MIT")
depends=("gnome-shell")
makedepends=("git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('c6840058999ad6133cda49e03db64686d4092edb42dc2c4711b3dd8f67b28b482a68aa90db73a8457feb97df85ccb0d80769a0fc37d0d1f484cd6e9f892377e4')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/${_name}-${pkgver}" "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}

