# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5d909dd720c5dd8c16ab7adc9c434ee125afba35f8d4b68c4a4d675536135728')
sha256sums_aarch64=('1577a963c09d8aeaa98e597078ca519e80ec9afb3ebd3236f459cd119bb115f4')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
