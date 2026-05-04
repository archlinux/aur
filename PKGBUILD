# Maintainer: gabrielearchapt <castielloangela512@gmail.com>

pkgname=apt-fake
pkgver=1.4
pkgrel=2
pkgdesc="A simple wrapper to use APT syntax on Arch Linux with Zenity GUI"
arch=('any')
url="https://aur.archlinux.org/packages/apt-fake"
license=('GPL-3.0-or-later')
depends=('bash' 'pacman' 'zenity')
source=("apt-fake" "apt-fake.desktop" "LICENSE")
sha256sums=('f74765deead50cf030592eea24797d60a5ff38c38163b7ed09c51a44ffb08061'
            '65aaf1cb417998cb2e10d50efbe0f25dcb9027770c4348735955d5203ee10c4d'
            'f2d0fb0bff185cc62bcaf383cadf63dddd1d527804c34757b87c422249063b15')

package() {
  # Install the script
  install -Dt "$pkgdir/usr/bin" -m755 apt-fake
  
  # Install the desktop entry
  install -Dt "$pkgdir/usr/share/applications" -m644 apt-fake.desktop
  
  # Install the license file
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
