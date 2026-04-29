# Maintainer: Gabriele castielloanegla512@gmail.com
pkgname=apt-fake-ubuntu
pkgver=1.1
pkgrel=1
pkgdesc="Simulate apt command"
arch=('any')
url="https://github.com/castielloangela512-ai/apt-fake" # Puoi metterci un link a caso o crearlo su GitHub
license=('GPL')
depends=('bash' 'yay' 'pacman')
source=('apt-fake')
sha256sums=('58b7c382f30f3d0a08afba492dc653d4845620fd163fc20f0cb8d94886af3e43')

package() {
    install -Dm755 "${srcdir}/apt-fake" "${pkgdir}/usr/local/bin/apt"
}
