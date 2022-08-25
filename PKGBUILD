#Maintainer: BoBeR182 <aur AT nullvoid DOT me>
#Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=goreplay-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="An open-source tool for capturing and replaying live HTTP traffic into a test environment in order to continuously test your system with real data. It can be used to increase confidence in code deployments, configuration changes and infrastructure changes"
arch=('x86_64')
url='https://goreplay.org'
license=('LGPL3')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/buger/goreplay/releases/download/${pkgver}/gor_${pkgver}_x64.tar.gz")
sha256sums=('d65e252847d869ece773a72589924cb242308746408a2f56f7a218bcf9f8512d')

package() {
  install -Dm755 "${srcdir}/gor" \
   "${pkgdir}/usr/bin/gor"
}
