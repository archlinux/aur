# Maintainer: Midov <midov at midov dot pl>
pkgname=gotty-bin
pkgver=1.3.0
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
md5sums_i686=('149b4fd25d57c48f68bd7330924ba305')
md5sums_x86_64=('bafe04ed4261e4cc969aa0b20c8e640f')
md5sums_arm=('037240074bd89bedf94067cd41295b3c')
md5sums_armv6h=('037240074bd89bedf94067cd41295b3c')
md5sums_armv7h=('037240074bd89bedf94067cd41295b3c')
md5sums_armv7l=('037240074bd89bedf94067cd41295b3c')
md5sums_armv5=('037240074bd89bedf94067cd41295b3c')

package() {
  install -Dm755 "${srcdir}/gotty" "${pkgdir}/usr/bin/gotty"
}
