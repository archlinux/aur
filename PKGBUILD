# Maintainer: Conrad Haupt <conrad@conradhaupt.com>
# Old-Maintainer: Ghassan Alduraibi <git@ghassan.dev>

_name=hide-keyboard-layout
_uuid=${_name}@sitnik.ru
pkgname=gnome-shell-extension-${_name}
pkgver=13
pkgrel=1
pkgdesc="GNOME Shell extension to hide keyboard layout indicator in status bar."
arch=("any")
url="https://github.com/ai/hide-keyboard-layout"
license=("MIT")
depends=("gnome-shell")
makedepends=("git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('b93f6bb6c964e2438b6d651b9f7df0d2aa24c0e793df4809659895e6e76156f699d59ea35778d53cc31f8855f6e5ed9fe8783c6e97c294432509a762984e0563')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/${_name}-${pkgver}" "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}

