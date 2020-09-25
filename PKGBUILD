# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=goreplay-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="An open-source tool for capturing and replaying live HTTP traffic into a test environment in order to continuously test your system with real data. It can be used to increase confidence in code deployments, configuration changes and infrastructure changes"
arch=('x86_64')
url='https://goreplay.org'
license=('LGPL3')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/buger/goreplay/releases/download/v${pkgver}/gor_v${pkgver}_x64.tar.gz")
sha256sums=('c77c22734c35eb054e08c06708c600178759d9bdecaf3c03a707de60a407046b')

package() {
  install -Dm755 "${srcdir}/gor" \
   "${pkgdir}/usr/bin/gor"
}
