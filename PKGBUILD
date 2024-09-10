# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.11
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

sha256sums_x86_64=('b68548453c6970e09046e6e0beb4697a2d9bc015ecc5dd3c38853eac5d9a69a2')
sha256sums_aarch64=('4152a79468986d643e28423b4c12dcba4d0831c2b28abd3ff0a02fedb2b130f4')
sha256sums_armv7h=('b16213a604500d6e863e3a0dc9f8f6e75d6b8ba63da55575fd64e1eb9d8e5f6b')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
