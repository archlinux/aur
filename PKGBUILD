# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.10
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

sha256sums_x86_64=('8e6d020c17e11dba73f0eb8a11f7ae6e3d96cdb307faf3c0ec13aa54e0cba055')
sha256sums_aarch64=('0ecbb98abb39f17bde2c0efae23f8446f4596c3a824aa6dda9b71723386b03ed')
sha256sums_armv7h=('b121733b9a18aa646a16393396dd7fe59e8773420a38acb05b91652c4d6cb356')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
