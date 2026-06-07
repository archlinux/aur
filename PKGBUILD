# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gomi-bin
pkgver=1.6.4
pkgrel=1
pkgdesc="Rm alternative written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/b4b4r07/gomi"
license=(MIT)
provides=('gomi')
conflicts=('gomi')
source_x86_64=(gomi-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/gomi_linux_x86_64.tar.gz)
source_aarch64=(gomi-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/gomi_linux_arm64.tar.gz)
sha256sums_x86_64=('d6a8edcdafbd63923e1bdf76f0ad8d06fb4394087e20a5f70979e81bf5a7cce8')
sha256sums_aarch64=('505d50f332004bd00dff4ad17c3e9a400e1a2e78c2c3b89b1f0f9c1721b4de84')

package() {
  install -D gomi -t "${pkgdir}/usr/bin/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
