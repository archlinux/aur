# Maintainer: Midov <midov at midov dot pl>
pkgname=gotty-bin
pkgver=0.0.12
pkgrel=1
pkgdesc="Simple command line tool that turns your CLI tools into web applications."
url="https://github.com/yudai/gotty"
arch=('x86_64' 'i686' 'arm')
license=('MIT')
source_i686=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_386.tar.gz)
source_x86_64=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_amd64.tar.gz)
source_arm=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_arm.tar.gz)
md5sums_i686=('0037bb69f786e3876e4c4e22e103f91b')
md5sums_x86_64=('a61ddfb21c30819a298db66731fd3dba')
md5sums_arm=('72f22769a8c4470627e4daea24c50f70')

package() {
  install -Dm755 "${srcdir}/gotty" "${pkgdir}/usr/bin/gotty"
}
