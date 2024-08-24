# Maintainer: PaddiM8 <aur@bakk.dev>
pkgname=elk-shell-bin
_pkgname=elk-shell
pkgver=0.0.2
pkgrel=1
pkgdesc="A shell language with syntax similar to that of a general-purpose language"
arch=('x86_64')
url="https://github.com/PaddiM8/elk"
license=('MIT')
makedepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://github.com/PaddiM8/elk/releases/download/v$pkgver/linux-x64.tar.xz")
b2sums=('SKIP')

package() {
  bsdtar xf linux-x64.tar.xz -C "$pkgdir/"
}

# vim:set ts=2 sw=2 et:
