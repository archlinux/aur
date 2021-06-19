# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=breezex-cursor-theme
pkgver=1.0.1
pkgrel=1
pkgdesc="Extended KDE Cursor theme, Highly inspired on KDE Breeze"
arch=('any')
url="https://github.com/ful1e5/BreezeX_Cursor"
license=('GPL')
depends=()
makedepends=()
source=("${url}/releases/download/v1%2C0.1/BreezeX-Light.tar.gz"
        "${url}/releases/download/v1%2C0.1/BreezeX-Dark.tar.gz")
sha256sums=('c9d352ed746f78ced486dc0ef8d6d99c973558366fb3cc55df439850e9ae73f8'
            '971fd634e99b023f47cb0baf16ebbc218bb4dc9158f454eee5daf77d9c2e2032')
package() {
  install -d "${pkgdir}/usr/share/icons"
  cp -r BreezeX-{Dark,Light} "${pkgdir}/usr/share/icons"
  find ${pkgdir} -type f -exec chmod 644 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;
}
