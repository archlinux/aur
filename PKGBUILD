# Maintainer: Conrad Haupt <conrad@conradhaupt.com>
# Old-Maintainer: Ghassan Alduraibi <git@ghassan.dev>

_name=hide-keyboard-layout
_uuid=${_name}@sitnik.ru
pkgname=gnome-shell-extension-${_name}
pkgver=9
pkgrel=1
pkgdesc="GNOME Shell extension to hide keyboard layout indicator in status bar."
arch=("any")
url="https://github.com/ai/hide-keyboard-layout"
license=("MIT")
depends=("gnome-shell")
makedepends=("git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('10aa0668771e6fb61deac19eaea2868947a0e29d9a238d643ac0405a59f26b4dc9a846c1c29275ad8b3add8e36487035ccaae6d271802677ef69eb0489e0a175')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/${_name}-${pkgver}" "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}

