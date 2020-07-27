# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hoverfly-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Lightweight service virtualization/API simulation tool for developers and testers"
arch=('x86_64')
url='https://hoverfly.io'
license=('Apache')
provides=('hoverfly')
provides=('hoverfly' 'hoverfly-git')
source=("${pkgname}-${pkgver}.zip::https://github.com/SpectoLabs/hoverfly/releases/download/v${pkgver}/hoverfly_bundle_linux_amd64.zip")
sha256sums=('4af0e0fc927a732eaa19a4e4f4b0a07e0cbef5145ee28f9ff22e2680f486e5bb')

package() {
  install -Dm755 hoverctl -t "${pkgdir}/usr/bin"
  install -Dm755 hoverfly -t "${pkgdir}/usr/bin"
}