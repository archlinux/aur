# Maintainer: Gabriele castielloanegla512@gmail.com
pkgname=apt-fake-ubuntu
pkgver=1.0
pkgrel=1
pkgdesc="Simulate apt command"
arch=('any')
url="https://github.com/castielloangela512-ai/apt-fake" # Puoi metterci un link a caso o crearlo su GitHub
license=('GPL')
depends=('bash' 'yay' 'pacman')
source=('apt-fake')
sha256sums=('27a144feeb7a45ead095849f18fa5e09309c7d1f1d4d5013df5abcc2ccf3b8bd')

package() {
    install -Dm755 "${srcdir}/apt-fake" "${pkgdir}/usr/local/bin/apt"
}
