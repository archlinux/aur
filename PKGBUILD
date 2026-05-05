# Maintainer: gabrielearchapt <castielloangela512@gmail.com>
pkgname=g-helper
pkgver=1.0.0
pkgrel=1
pkgdesc="A powerful and lightweight AUR helper designed to work with apt-fake-ubuntu"
arch=('any')
url="https://aur.archlinux.org/packages/g-helper"
license=('GPL3')
depends=('bash' 'git' 'pacman' 'curl')
source=('g-helper')
sha256sums=('01c2670bfef9984ec2e4984d2c4420493d1700f8d90f3f23ee2e608029f5fc21')

package() {
  # Install the script to /usr/bin/g-helper
  install -Dm755 "${srcdir}/g-helper" "${pkgdir}/usr/bin/g-helper"
}
