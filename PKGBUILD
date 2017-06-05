# Maintainer: Midov <midov at midov dot pl>
pkgname=gotty-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple command line tool that turns your CLI tools into web applications."
url="https://github.com/yudai/gotty"
arch=('x86_64' 'i686' 'arm')
license=('MIT')
source_i686=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_386.tar.gz)
source_x86_64=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_amd64.tar.gz)
source_arm=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_arm.tar.gz)
md5sums_i686=('5621b2376a03a4ec6223d17ed7931699')
md5sums_x86_64=('4b13c53c3991310d5ef2dbdd70ee1284')
md5sums_arm=('7120937f7935820692c8c9f6aef3e3d1')

package() {
  install -Dm755 "${srcdir}/gotty" "${pkgdir}/usr/bin/gotty"
}
