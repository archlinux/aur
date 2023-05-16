# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gomi-bin
pkgver=1.1.6
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
sha256sums_x86_64=('3b05a1e4bc0c047a6b8083ff7c65fe7ef52dbbf8dfcec1039a3358cc693a908a')
sha256sums_i686=('529fed6edbf15ff2455700559534092d75cfaad34c84cd045521bbf4c81e6626')
sha256sums_aarch64=('3f5c72391b1d3e24fb950d16337dd96c1cbcd49a6b8d8f0088d8efc59c96b59b')

package() {
  install -D gomi -t "${pkgdir}/usr/bin/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
