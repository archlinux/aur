# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=breezex-cursor-theme
pkgver=2.0.1
pkgrel=1
pkgdesc="Extended KDE Cursor theme, Highly inspired on KDE Breeze"
arch=('any')
url="https://github.com/ful1e5/BreezeX_Cursor"
license=('GPL')
depends=()
makedepends=()
source=("${url}/releases/download/v${pkgver}/BreezeX-Light.tar.xz"
        "${url}/releases/download/v${pkgver}/BreezeX-Dark.tar.xz"
        "${url}/releases/download/v${pkgver}/BreezeX-Black.tar.xz")
sha256sums=('40c1bdb224e611e03c9865a49a5b4f8131974cb6fab30af428c2a1a969484aa8'
            '8cdf743466b0f1565fe5f290dd48ef4c02d91778458d0d3cc56437515255b653'
            '773b75523748173409ee622841b0f74b1e80617a5c5b3dcbb53a7ac3d06cc233')
package() {
  install -d "${pkgdir}/usr/share/icons"
  cp -r BreezeX-{Dark,Light,Black} "${pkgdir}/usr/share/icons"
  find ${pkgdir} -type f -exec chmod 644 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;
}
