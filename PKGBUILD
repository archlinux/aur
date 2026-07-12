# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c084feec34435a5724c0453e37f147bb3ca42dab76f574be15892c7cfa599444')
sha256sums_aarch64=('5d27448430e6b9fca4f728d1920dd601051657e208d2be1b717bcb585f67e076')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
