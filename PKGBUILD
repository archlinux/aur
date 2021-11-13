# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=breezex-cursor-theme
pkgver=1.0.3
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
sha256sums=('5c44d78578ea6fe16a5bc1b7c06b02b8c2246f4e6c4f999b2504e46472a4549c'
            '9649186ccdb56ffb77b4340cf3c481af499fa82571a5525c33f992b1c888c198'
            '640a83b32cc3d1f9d483b96b153f0adc0d68300f413373d56ed92c3ed2a3e368')
package() {
  install -d "${pkgdir}/usr/share/icons"
  cp -r BreezeX-{Dark,Light,Black} "${pkgdir}/usr/share/icons"
  find ${pkgdir} -type f -exec chmod 644 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;
}
