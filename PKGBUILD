# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.13
pkgrel=1
pkgdesc="Command line interface for LibreSpeed speed test backends. Written in Go."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/librespeed/speedtest-cli"
license=('LGPL3')
provides=('librespeed-cli')
conflicts=('librespeed-cli')

source_x86_64=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_armv7.tar.gz")

sha256sums_x86_64=('33f2278a6ae16e83dc80f38a16aa8689b0b315530ce30ccb6de7968a2bf7527a')
sha256sums_aarch64=('3f59e01ea03626168a0ff3d6f3371a38c054267ee500a5f9a644d3fe28ceed69')
sha256sums_armv7h=('36e787a3f2ad3c7540fb284675bbf516f7796ddb6ebb023d2f627dba14c586b6')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
