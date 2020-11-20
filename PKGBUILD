# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hoverfly-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Lightweight service virtualization/API simulation tool for developers and testers"
arch=('x86_64')
url='https://hoverfly.io'
license=('Apache')
provides=('hoverfly')
conflicts=('hoverfly' 'hoverfly-git')
source=("${pkgname}-${pkgver}.zip::https://github.com/SpectoLabs/hoverfly/releases/download/v${pkgver}/hoverfly_bundle_linux_amd64.zip")
sha256sums=('4c3e6670b9f6a205e2ec3cf6b85362774f70980ee47c51295ff3d3659903ef7e')

package() {
  install -Dm755 hoverctl -t "${pkgdir}/usr/bin"
  install -Dm755 hoverfly -t "${pkgdir}/usr/bin"
}
