# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.1.8
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('06a6748a425ca47dc1816db5997dd1820b7a3bd6366cef9ce14c1befcc27e83c')
sha256sums_aarch64=('254f4c36127b1040b8a68595d263b3f1eae1701f49d8492baa49d6cfc73bcc18')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
