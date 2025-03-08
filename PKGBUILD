# Maintainer: PaddiM8 <aur@bakk.dev>
pkgname=elk-shell-bin
_pkgname=elk-shell
pkgver=0.0.3
pkgrel=1
pkgdesc="A shell language with syntax similar to that of a general-purpose language"
arch=('x86_64' 'aarch64')
url="https://github.com/PaddiM8/elk"
license=('MIT')
makedepends=()
provides=($_pkgname)
conflicts=($_pkgname)
b2sums=('SKIP')

set_source() {
    case "$CARCH" in
        x86_64)
            source=("https://github.com/PaddiM8/elk/releases/download/v$pkgver/linux-x64.tar.xz")
            ;;
        aarch64)
            source=("https://github.com/PaddiM8/elk/releases/download/v$pkgver/linux-arm64.tar.xz")
            ;;
    esac
}

set_source

package() {
  bsdtar xf linux-*.tar.xz -C "$pkgdir/"
}

# vim:set ts=2 sw=2 et:
