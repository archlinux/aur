# Maintainer: Midov <midov at midov dot pl>
pkgname=gotty-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple command line tool that turns your CLI tools into web applications."
url="https://github.com/yudai/gotty"
arch=('x86_64' 'i686' 'arm')
license=('MIT')
source_i686=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_386.tar.gz)
source_x86_64=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_amd64.tar.gz)
source_arm=(https://github.com/yudai/gotty/releases/download/v${pkgver}/gotty_linux_arm.tar.gz)
md5sums_i686=('50884dc6640bf1751b864d20f14eca7b')
md5sums_x86_64=('3c923e9130d71a47823c46ec4de3781b')
md5sums_arm=('9d2fbd5d1c8dd6f661307a4b02f8c9b9')

package() {
  install -Dm755 "${srcdir}/gotty" "${pkgdir}/usr/bin/gotty"
}
