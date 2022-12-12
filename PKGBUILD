# Maintainer: Fredrik Strandin <fredrik at strandin dot name>
pkgname=emoji-keyboard
pkgver=4.0.0
pkgrel=4
pkgdesc="Virtual keyboard-like emoji picker for linux"
arch=('i686' 'x86_64')
url="https://github.com/OzymandiasTheGreat/emoji-keyboard"
license=('GPL3')
depends=('python' 'python-gobject' 'libappindicator-gtk3' 'python-evdev' 'fuse')
source=("https://github.com/OzymandiasTheGreat/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.AppImage")
sha256sums=('860563b900c3df7f1bfc3fa3cf0d269a66cd5d098f22c7e14f62e2bc04e99c02')
options=(!strip)

package() {
  chmod a+x ${pkgname}_${pkgver}_amd64.AppImage
  mkdir -p ${pkgdir}/usr/bin
  cp -L ${pkgname}_${pkgver}_amd64.AppImage ${pkgdir}/usr/bin/emoji-keyboard
}


# vim:set ts=2 sw=2 et:
