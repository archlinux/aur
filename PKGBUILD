# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.9
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

sha256sums_x86_64=('72654b4d1cfc298e021fb3cef38cec34de373031286d30e69eba1a9d1a91817a')
sha256sums_aarch64=('49999c767d5eaedb949af8f51804b47df0c611ca526f8929c3cffd54f1946722')
sha256sums_armv7h=('8fa932b78637d4f7f1e01c9b40ffe06f3efc99750431a97ce0a9e360ced95019')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
