# Maintainer: gabrielearchapt <tua-email@esempio.com>
pkgname=g-helper
pkgver=1.0.0
pkgrel=1
pkgdesc="A professional and beautiful AUR helper with security auditing"
arch=('any')
url="https://aur.archlinux.org/packages/g-helper"
license=('GPL3')
depends=('jq' 'curl' 'git' 'pacman')
source=('g-helper' 'install.sh')
sha256sums=('e004442cb420d6603ce309d825db61d09016204e553211fa9b4c1d61915245c0'
            '3b50a706028b90be99fd837370a5ad280e01d5abbedc3abd05387dffa8bff873')

package() {
  # Install the main script
  install -Dm755 "${srcdir}/g-helper" "${pkgdir}/usr/bin/g-helper"
  
  # Install the bootstrap script in a documentation folder or as a utility
  install -Dm755 "${srcdir}/install.sh" "${pkgdir}/usr/share/doc/${pkgname}/install.sh"
}
