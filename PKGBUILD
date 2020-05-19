# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pinghd-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='A cross-platform, and standalone tool to prevent all of your hard drives from entering auto-sleep mode'
arch=('i686' 'x86_64')
url='https://github.com/m2adel/PingHD'
license=('GPL3')
provides=('pinghd')
depends=('gtk2')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/m2adel/PingHD/releases/download/${pkgver}/PingHD.tar.xz")
sha256sums=('0ec112fc7c1cfc2e86795a786d95a8c274bbd2e8cd50b334812f70e5afcb1559')

package() {
  install -Dm755 PingHD "${pkgdir}/usr/bin/pinghd"
}