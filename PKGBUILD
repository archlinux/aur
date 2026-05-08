# Maintainer: gabrielearchapt <castielloangela512@gmail.com>
pkgname=apt-fake-ubuntu
pkgver=1.8
pkgrel=1
pkgdesc="Advanced Ubuntu apt wrapper for Arch with History and GUI (v1.8)"
arch=('any')
license=('GPL3')
depends=('pacman' 'bash' 'g-helper' 'zenity')
source=('apt' 'apt-fake.desktop' 'apt-fake.png')
sha256sums=('fcbd8c70fae2b1aa4ff5f604f6e64a9b30013fe68d1b8ff61da490a83656c2ae'
            '81b7e66f512f1fe7ac507462b138fb6291b0a3601e09a4d763949b1271014553'
            '2efa2b8821340fc09e7db18bc1a8285e110e0bbcef9795729cbabf11ad57f184')

package() {
  install -Dm755 "${srcdir}/apt" "${pkgdir}/usr/bin/apt"
  install -Dm644 "${srcdir}/apt-fake.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apt-fake.png"
  install -Dm644 "${srcdir}/apt-fake.desktop" "${pkgdir}/usr/share/applications/apt-fake.desktop"
}
