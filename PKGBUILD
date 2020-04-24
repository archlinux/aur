# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=goreplay-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="An open-source tool for capturing and replaying live HTTP traffic into a test environment in order to continuously test your system with real data. It can be used to increase confidence in code deployments, configuration changes and infrastructure changes"
arch=('x86_64')
url='https://goreplay.org'
license=('LGPL-3.0')
provides=("${pkgname%-bin}")
source=("https://github.com/buger/goreplay/releases/download/v${pkgver}/gor_${pkgver}_x64.tar.gz")
sha256sums=('631b92e63b5f8757beb1b0f80298dcc7dbd991435c419f64156a68e89e8ab162')

package() {
  install -Dm755 "${srcdir}/gor" \
   "${pkgdir}/usr/bin/gor"
}