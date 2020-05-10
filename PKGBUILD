# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dockerfile-generator-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Generates dockerfiles based on various input channels"
arch=('x86_64')
url='https://github.com/ozankasikci/dockerfile-generator'
license=('GPL3')
provides=("${pkgname%-bin}" 'dfg')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/dfg_v${pkgver}_linux_amd64")
sha256sums=('44be953beab7072a1fb459632668b4b7ca49bccc6bbd203f005bf3ee387f0655')

package() {
  install -Dm755 "${srcdir}/"dockerfile* "${pkgdir}/usr/bin/dfg"
}