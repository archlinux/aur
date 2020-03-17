# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.3
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

sha256sums_x86_64=('802a224bb9c58fbd6fccd43cd2fbf78701781d1174d3a32c14fba64396ec2dfd')
sha256sums_aarch64=('8e1212ab7cb2d4656d6fc887f7dac8aa45a61a442a7151f347bf91ae2248c0dd')
sha256sums_armv7h=('d819368e760c49eb7691563fc5ae4609d29ebbfdee35e5702baf09068bff45e4')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
