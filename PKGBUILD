# Mantainer gabrielearchapt <castielloangela512@gmail.com>
pkgname=apt-fake-ubuntu
pkgver=2.0
pkgrel=1
pkgdesc="Gabriele's Flagship Package Manager (v2.0)"
arch=('any')
depends=('pacman' 'zenity' 'g-helper')
source=('apt' 'apt-fake.desktop' 'apt-fake.png')
sha256sums=('b1680ba9502f53307c12181a717b4923c0c479193a0af78af2edf3cf03467a51'
            '81b7e66f512f1fe7ac507462b138fb6291b0a3601e09a4d763949b1271014553'
            '2efa2b8821340fc09e7db18bc1a8285e110e0bbcef9795729cbabf11ad57f184')

package() {
  install -Dm755 apt "${pkgdir}/usr/bin/apt"
  install -Dm644 apt-fake.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apt-fake.png"
  install -Dm644 apt-fake.desktop "${pkgdir}/usr/share/applications/apt-fake.desktop"
}
