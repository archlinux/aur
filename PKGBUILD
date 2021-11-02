# Maintainer: Mikhail K. <u@xaked.com>

pkgname="cursor-theme-macos-big-sur"
_gitname="apple_cursor"
_cursor_name="macOSBigSur"
pkgver=1.2.2
pkgrel=1
pkgdesc="Big Sur cursors theme for linux desktops."
arch=("any")
depdends=('libx11' 'libxcursor' 'libpng')
makedepends=('git')
url="https://github.com/ful1e5/${_gitname}"
license=("GPL3")
source=("https://github.com/ful1e5/${_gitname}/releases/download/v${pkgver}/${_cursor_name}.tar.gz")
sha1sums=("79e0d03c02c47f0f3de13d9ae36e42a2bd8a7309")

pkgver() {
  echo $pkgver;
}

package() {
  rm -rf "${pkgdir}/usr/share/icons/";
  mkdir -p "${pkgdir}/usr/share/icons/";
  cp -pr "${srcdir}/${_cursor_name}" "${pkgdir}/usr/share/icons/${_cursor_name}";
}
