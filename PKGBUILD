# Maintainer: gabrielearchapt <tua-email>

pkgname=apt-fake-ubuntu
pkgver=1.4
pkgrel=1
pkgdesc="A simple wrapper to use APT syntax on Arch Linux with Zenity GUI"
arch=('any')
url="https://aur.archlinux.org/packages/apt-fake"
license=('GPL-3.0-or-later')
depends=('bash' 'pacman' 'zenity')
source=("apt-fake" "apt-fake.desktop")
sha256sums=('f74765deead50cf030592eea24797d60a5ff38c38163b7ed09c51a44ffb08061'
            '65aaf1cb417998cb2e10d50efbe0f25dcb9027770c4348735955d5203ee10c4d')

package() {

  install -Dt "$pkgdir/usr/bin" -m755 apt-fake
  
  install -Dt "$pkgdir/usr/share/applications" -m644 apt-fake.desktop
}
