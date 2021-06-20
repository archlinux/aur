# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=breezex-cursor-theme
pkgver=1.0.2
pkgrel=2
pkgdesc="Extended KDE Cursor theme, Highly inspired on KDE Breeze"
arch=('any')
url="https://github.com/ful1e5/BreezeX_Cursor"
license=('GPL')
depends=()
makedepends=()
source=("${url}/releases/download/v${pkgver}/BreezeX-Light.tar.gz"
        "${url}/releases/download/v${pkgver}/BreezeX-Dark.tar.gz"
        "${url}/releases/download/v${pkgver}/BreezeX-Black.tar.gz")
sha256sums=('3c8e6c6d6adf7c6c3079e6812326b170c53f4d94a9f420a5756591c31fb8f129'
            '24bc34b87c7b8aa1c82d799bc2986808d1c6c1c9c712fc06a65cf9c3fd3600a1'
            'e345507322b8d579da2c99c258cc84aa9e838bf0c4307d7aff01197289086465')
package() {
  install -d "${pkgdir}/usr/share/icons"
  cp -r BreezeX-{Dark,Light,Black} "${pkgdir}/usr/share/icons"
  find ${pkgdir} -type f -exec chmod 644 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;
}
