# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5f1f3a77f184386d9faa69ad3bb3ec8731b905c16136902a9cc83fc7e4f13b9f')
sha256sums_aarch64=('88233c6768ff1740958eadc0ecc21342c2b1d0e395d547c7d2ffe6e730d705bf')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
