# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1fbd661368accaf708cd613ee7bac7052f081a1c59fda2d4f9a995ac466cbcdc')
sha256sums_aarch64=('e9a284b7aabb4d8eec2ef4e2979eb5103cc65476b6d97ab99ff073e6271227db')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
