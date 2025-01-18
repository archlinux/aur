# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gomi-bin
pkgver=1.1.8
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
sha256sums_x86_64=('e00c91f74fdc70e7d60aaeeafc0f7d2e3be8613a2851073b329cb221635c7725')
sha256sums_i686=('5fb9792c302ae71f2f5a2377c376ad84121727abe1d790f1fd659f48a1a0a0a5')
sha256sums_aarch64=('4d747a16019c0b3e10a3da2dcc136b987406a61d729fcdbc71d5dca58e9ff853')

package() {
  install -D gomi -t "${pkgdir}/usr/bin/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
