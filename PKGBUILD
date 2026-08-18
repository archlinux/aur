# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.14
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

sha256sums_x86_64=('89800767ac14085c78a20847ebea23340f6c14a78de0a15c2ac7db8b565c961f')
sha256sums_aarch64=('75e51a2494d03cb35a92ddbf862b40571a25a1526f3cf3dfa8b1d5d7bc622bd9')
sha256sums_armv7h=('527591b4049136feeed73a00203f27362ce6aab7f11973c4985d1507ee469ec4')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
