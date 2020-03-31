# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Command line interface for LibreSpeed speed test backends"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/librespeed/speedtest-cli"
license=('LGPL3')
provides=('librespeed-cli')
conflicts=('librespeed-cli')

source_x86_64=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_armv7.tar.gz")

sha256sums_x86_64=('74933f62f8e7834f8e2166621a59e509938b64b7c506e4161006fb6951e46191')
sha256sums_aarch64=('0a8aaa5e7eccbd50459875b3cc260a764ad91a0d1ae02dffc735169629462433')
sha256sums_armv7h=('579757534f3c2fd75b7ad6356e261d7b5a626c99defdbc6731d0184e6c63a7f2')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
