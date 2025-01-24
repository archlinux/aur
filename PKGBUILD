# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gomi-bin
pkgver=1.1.9
pkgrel=1
pkgdesc="Rm alternative written in Go"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/b4b4r07/gomi"
license=(MIT)
provides=('gomi')
conflicts=('gomi')
source_x86_64=(gomi-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/gomi_linux_x86_64.tar.gz)
source_i686=(gomi-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/gomi_linux_i386.tar.gz)
source_aarch64=(gomi-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/gomi_linux_arm64.tar.gz)
sha256sums_x86_64=('daf283dcf00f77fa23fcc7cd0adb38a84ac7ee02d2e510305381e582f40552e0')
sha256sums_i686=('ac20295d1aa667d1a5792fd2e0112a4971769a753eb726d7ebe50c082ce3079e')
sha256sums_aarch64=('9bde8b3c1aa0143e41011ae42c5b6391d748ae5f23998f5696f6ac2686e0fd3c')

package() {
  install -D gomi -t "${pkgdir}/usr/bin/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
