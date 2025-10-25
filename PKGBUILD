# Maintainer: Midov <midov at midov dot pl>
pkgname=gotty-bin
pkgver=1.6.0
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
md5sums_x86_64=('b98f86d6b8141d6161b405c2565712eb')
md5sums_arm=('933f74b018874ac83b6aad0a05167716')

package() {
  install -Dm755 "${srcdir}/gotty" "${pkgdir}/usr/bin/gotty"
}
