# Maintainer: Fredrik Strandin <fredrik at strandin dot name>
pkgname=emoji-keyboard
pkgver=3.1.1
pkgrel=3
pkgdesc="Virtual keyboard-like emoji picker for linux"
arch=('i686' 'x86_64')
url="https://github.com/OzymandiasTheGreat/emoji-keyboard"
license=('GPL3')
depends=('python' 'python-gobject' 'libappindicator-gtk3' 'python-evdev' 'fuse')
source=("https://github.com/OzymandiasTheGreat/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.AppImage")
sha256sums=('4ee945e2f67aad661246c8d6b91251f05e232e56a82ef0decb71261847c4b0aa')


package() {
  install -Dm ${pkgname}-${pkgver}.AppImage ${pkgdir}/usr/bin/emoji-keyboard
}


# vim:set ts=2 sw=2 et:
