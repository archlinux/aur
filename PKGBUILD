# Maintainer: agony <27015 at riseup dot net>

pkgname=mp4ff-bin
pkgver=0.61.0
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
sha256sums_x86_64=('9bd523a82d2750e5f8cc46afd006a9574a90d7a189dcd97bde2a8c1eb526e684')
sha256sums_aarch64=('255d32e70eb9f6a028b413d9b793ac64d6590ad1cfe9c63de3bf6984682ac4a7')

package() {
  install -Dm755 mp4ff-* -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
