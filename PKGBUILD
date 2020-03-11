# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.1
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

sha256sums_x86_64=('3010df704bb66c3d649b67a935a6333c4d391a89466f64ea30f1f43308ec0812')
sha256sums_aarch64=('3e9c99756df559940560e4a51d116558c9db296fff40b1a45050c08bc313c309')
sha256sums_armv7h=('84795e33946d2cd1f7ee231df5be1506414ac9b3d2d11d2f870c9ad72a25a114')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
