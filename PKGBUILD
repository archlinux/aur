# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=no-appimage-desktop-integration
pkgver=1
pkgrel=1
pkgdesc='Disables “Would you like to integration {AppImage} with your system?” dialogues.'
arch=('any')
url='https://github.com/electron-userland/electron-builder/issues/1962#issuecomment-352531262'
# There’s nothing to copyright… the package is literally a single empty file.
license=('CC0')

build() {
  touch no_desktopintegration
}

package() {
  install -Dm644 no_desktopintegration "$pkgdir"/usr/share/appimagekit/no_desktopintegration
}
