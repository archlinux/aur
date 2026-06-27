# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3efd0e39a1c15f5ca54f7047603ca97549edbb7851c9c1789f360214d23652ed')
sha256sums_aarch64=('a15e44103f81dff29f54f90ebc3a0e35fef26090a083ddd80ee9e4c1fdaaa9bf')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
