# Maintainer: agony <27015 at riseup dot net>

pkgname=mp4ff-bin
pkgver=0.62.0
pkgrel=1
pkgdesc='Tools for parsing and manipulating MP4/ISOBMFF files (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/Eyevinn/mp4ff'
license=('MIT')
provides=("mp4ff=${pkgver}")
conflicts=('mp4ff')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_release}/mp4ff_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_release}/mp4ff_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('adad87aceaabb24cd3ca30becca07baf8f7b19701645b65241e8767b4a07792e')
sha256sums_aarch64=('20942f0b0247fafc0edc054ee1566bfb254c8fe3a4c81d9b5ad51036d25df362')

package() {
  install -Dm755 mp4ff-* -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
