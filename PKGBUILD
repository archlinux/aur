# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gomi-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Rm alternative written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/b4b4r07/gomi"
license=(MIT)
provides=('gomi')
conflicts=('gomi')
source_x86_64=(gomi-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/gomi_linux_x86_64.tar.gz)
source_aarch64=(gomi-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/gomi_linux_arm64.tar.gz)
sha256sums_x86_64=('54346159a9378242e908e30799f311f89e20d627d7928e298406451b99e1b5f9')
sha256sums_aarch64=('25269e5d6ec9d6695d83050fe874586793d86186543a9b99b5c944502d4b61e0')

package() {
  install -D gomi -t "${pkgdir}/usr/bin/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
