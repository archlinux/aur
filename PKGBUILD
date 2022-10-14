# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=breezex-cursor-theme
pkgver=2.0.0
pkgrel=1
pkgdesc="Extended KDE Cursor theme, Highly inspired on KDE Breeze"
arch=('any')
url="https://github.com/ful1e5/BreezeX_Cursor"
license=('GPL')
depends=()
makedepends=()
source=("${url}/releases/download/v${pkgver}/BreezeX-Light.tar.gz"
        "${url}/releases/download/v${pkgver}/BreezeX-Dark.tar.gz"
        "${url}/releases/download/v${pkgver}/BreezeX-Black.tar.gz")
sha256sums=('9f339954d999811a5760e4f51ff6c9b55d219444144f08bebbed994d9c52f0cf'
            '9e4c5d02a2981568725d91a7d6b67440f0d327f92a3cc641bf103bfa0961853b'
            'bf77913a2796c2e36e80efa8e31379db19c916312342e55a664ac6961c28656e')
package() {
  install -d "${pkgdir}/usr/share/icons"
  cp -r BreezeX-{Dark,Light,Black} "${pkgdir}/usr/share/icons"
  find ${pkgdir} -type f -exec chmod 644 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;
}
