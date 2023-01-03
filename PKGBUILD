# Maintainer: Ghassan Alduraibi <git@ghassan.dev>

_name=hide-keyboard-layout
_uuid=${_name}@sitnik.ru
pkgname=gnome-shell-extension-${_name}
pkgver=5
pkgrel=1
pkgdesc="GNOME Shell extension to hide keyboard layout indicator in status bar."
arch=("any")
url="https://github.com/ai/hide-keyboard-layout"
license=("MIT")
depends=("gnome-shell")
makedepends=("git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('bc87efa5b1264fc66be9409930db353e8c01bf237bb2a44f1cd425ab2e71fe81dd9fd4957f959b5a695f0b45d807cf72ef836fe1f39175a7b8e38a83e0171b88')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/${_name}-${pkgver}" "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}

