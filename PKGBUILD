# Maintainer: Midov <midov at midov dot pl>
pkgname=gotty-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple command line tool that turns your CLI tools into web applications."
url="https://github.com/sorenisanerd/gotty"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'armv7l' 'armv6h' 'armv5')
license=('MIT')
source_i686=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_386.tar.gz)
source_x86_64=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_amd64.tar.gz)
source_arm=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_arm.tar.gz)
source_armv6h=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_arm.tar.gz)
source_armv7h=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_arm.tar.gz)
source_armv7l=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_arm.tar.gz)
source_armv5=(https://github.com/sorenisanerd/gotty/releases/download/v${pkgver}/gotty_v${pkgver}_linux_arm.tar.gz)
md5sums_i686=('dcb75ff8af32b6dce8c1fc433e8f286c')
md5sums_x86_64=('ccc8df3c8f5d4de0afce89ec87a553c2')
md5sums_arm=('7025921a043b508f6e2a5d3bb328087a')
md5sums_armv6h=('7025921a043b508f6e2a5d3bb328087a')
md5sums_armv7h=('7025921a043b508f6e2a5d3bb328087a')
md5sums_armv7l=('7025921a043b508f6e2a5d3bb328087a')
md5sums_armv5=('7025921a043b508f6e2a5d3bb328087a')

package() {
  install -Dm755 "${srcdir}/gotty" "${pkgdir}/usr/bin/gotty"
}
