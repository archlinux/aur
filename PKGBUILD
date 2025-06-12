# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.12
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

sha256sums_x86_64=('78bf5cd10fc00006224efb82f5767b95ba414a7ca4dc315a7ed2b774ed80813c')
sha256sums_aarch64=('e8d6fb054aee8bbfcad8c9f70fc89e983800f64221cfbb9b62ba1842bfcad6d4')
sha256sums_armv7h=('610aa869eb8db44599960fded5ce4e8833bbf332e3204ea998c2427bb47a271e')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
