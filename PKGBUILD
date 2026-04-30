# Maintainer: Gabriele castielloanegla512@gmail.com
pkgname=apt-fake-ubuntu
pkgver=1.2
pkgrel=1
pkgdesc="Simulate apt command"
arch=('any')
url="https://github.com/castielloangela512-ai/apt-fake" # Puoi metterci un link a caso o crearlo su GitHub
license=('GPL')
depends=('bash' 'yay' 'pacman' 'zenity')
source=('apt-fake')
sha256sums=('14cc1a887206676c234fe3869610fed6a26603c6c5269eee59b63e02404845cd')

package() {
    install -Dm755 "${srcdir}/apt-fake" "${pkgdir}/usr/local/bin/apt"
}
