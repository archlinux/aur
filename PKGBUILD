# Maintainer: Midov <midov at midov dot pl>
pkgname=gotty-bin
pkgver=1.4.0
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
md5sums_i686=('dafb305f339f0567f8eed25917c84cc6')
md5sums_x86_64=('975d39ae3c6d72d19bf1504d291b4405')
md5sums_arm=('09de8befd0ae61cae922653bc83a6dbf')
md5sums_armv6h=('09de8befd0ae61cae922653bc83a6dbf')
md5sums_armv7h=('09de8befd0ae61cae922653bc83a6dbf')
md5sums_armv7l=('09de8befd0ae61cae922653bc83a6dbf')
md5sums_armv5=('09de8befd0ae61cae922653bc83a6dbf')

package() {
  install -Dm755 "${srcdir}/gotty" "${pkgdir}/usr/bin/gotty"
}
