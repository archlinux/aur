# Maintainer: Midov <midov at midov dot pl>
pkgname=gotty-bin
pkgver=0.0.13
pkgrel=1
pkgdesc="Simple command line tool that turns your CLI tools into web applications."
url="https://github.com/yudai/gotty"
arch=('x86_64' 'i686' 'arm')
license=('MIT')
source_i686=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_386.tar.gz)
source_x86_64=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_amd64.tar.gz)
source_arm=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_arm.tar.gz)
md5sums_i686=('63a1888674c9e8000e76e46a63e51a8b')
md5sums_x86_64=('b4e22fe8574521154e37a4fe93b4d403')
md5sums_arm=('cc13f3b2a1ec91d934d03736c61fdd15')

package() {
  install -Dm755 "${srcdir}/gotty" "${pkgdir}/usr/bin/gotty"
}
