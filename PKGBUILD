# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Command line interface for LibreSpeed speed test backends"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/librespeed/speedtest-cli"
license=('LGPL3')
provides=('librespeed-cli')
conflicts=('librespeed-cli')

source_x86_64=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}-linux-arm64.tar.gz")
source_armv7h=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}-linux-armv7.tar.gz")

sha256sums_x86_64=('8b2b68a970ea22b6705bfbbbe7c8c55bbbbc6e9fe392f054a017fb9b37607e24')
sha256sums_aarch64=('6b7cf8a330f4a3fd58492052855c02aa8576d5843fc2e9d432023483a58fd93f')
sha256sums_armv7h=('0b242f8959e43e1644226a0223a9b444c638614f3f6f098b56f9b4978e947a81')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
