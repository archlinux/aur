# Maintainer: Midov <midov at midov dot pl>
pkgname=gotty-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Simple command line tool that turns your CLI tools into web applications."
url="https://github.com/sorenisanerd/gotty"
arch=('x86_64' 'arm')
license=('MIT')
source_i686=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_386.tar.gz)
source_x86_64=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_amd64.tar.gz)
source_arm=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_arm.tar.gz)
source_armv6h=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_arm.tar.gz)
source_armv7h=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_arm.tar.gz)
source_armv7l=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_arm.tar.gz)
source_armv5=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_arm.tar.gz)
md5sums_x86_64=('b4ab6bc8b6c48edd50f0dcaeb2d40547')
md5sums_arm=('fd8f1ce775701d7af92441be8820be0e')

package() {
  install -Dm755 "${srcdir}/gotty" "${pkgdir}/usr/bin/gotty"
}
