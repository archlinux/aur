# Maintainer: Mikhail K. <u@xaked.com>

pkgname="cursor-theme-macos-big-sur"
_gitname="apple_cursor"
_cursor_name="macOSBigSur"
pkgver=1.1.5
pkgrel=1
pkgdesc="Big Sur cursors theme for linux desktops."
arch=("any")
depdends=('libx11' 'libxcursor' 'libpng')
makedepends=('git')
url="https://github.com/ful1e5/${_gitname}"
license=("GPL3")
source=("https://github.com/ful1e5/${_gitname}/releases/download/v${pkgver}/${_cursor_name}.tar.gz")
sha1sums=("1144e9c8ebf2dc57aeea907b6352c80621d87a83")

pkgver() {
  echo $pkgver;
}

package() {
  rm -rf "${pkgdir}/usr/share/icons/";
  mkdir -p "${pkgdir}/usr/share/icons/";
  cp -pr "${srcdir}/${_cursor_name}" "${pkgdir}/usr/share/icons/${_cursor_name}";
}
