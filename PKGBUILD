# Maintainer: Mikhail K. <u@xaked.com>

pkgname="cursor-theme-macos-big-sur"
_gitname="apple_cursor"
_cursor_name="macOSBigSur"
pkgver=1.1.4
pkgrel=1
pkgdesc="Big Sur cursors theme for linux desktops."
arch=("any")
makedepends=('git')
url="https://github.com/ful1e5/${_gitname}"
license=('GPL3')
source=("https://github.com/ful1e5/${_gitname}/releases/download/v${pkgver}/${_cursor_name}.tar.gz")
sha1sums=('9d88c50ad5b2aaa4d76a1b1a15df2429f4d0661f')

package() {
  ls -la;
  mkdir -p "${pkgdir}/usr/share/icons/"
  cp -pr "${srcdir}/${_cursor_name}" "${pkgdir}/usr/share/icons/${_cursor_name}"
}
