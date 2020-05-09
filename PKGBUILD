# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bee-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='A tool for helping develop with beego app framework'
arch=('x86_64')
url="https://github.com/beego/bee"
license=('Apache')
provides=('bee')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/bee_${pkgver}_linux_amd64.tar.gz")
sha256sums=('3d46f5ea4657937a327141b6feadc61ce4a8dffc9f9cec8f0738299bfb15e29d')

package() {
  install -Dm755 "${srcdir}/bee_${pkgver}_linux_amd64"/bee "${pkgdir}/usr/bin/bee"
}
# vim:set ts=2 sw=2 et: