# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gomi-bin
pkgver=1.5.1
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
sha256sums_x86_64=('fd09fe69421420a52741ca968c305e63c9626f01c65e70f14a4dfc08d1c30aaf')
sha256sums_i686=('2f3715513fc2e3b5f6d740e8c9c45aae40ce0c0708549390e8914aeea16cdf59')
sha256sums_aarch64=('ae6e1a7162fa24fbc4357dee1948be28c4ce308fc46013c3b9808006183bfd07')

package() {
  install -D gomi -t "${pkgdir}/usr/bin/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
