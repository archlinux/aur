# Maintainer: mingming

pkgname=ucloud-bin
pkgver=0.3.3
pkgrel=1
pkgdesc='Command line interface for UCloud services'
arch=('x86_64' 'aarch64')
url='https://github.com/ucloud/ucloud-cli'
license=('Apache-2.0')
depends=('glibc')
provides=('ucloud' 'ucloud-cli')
conflicts=('ucloud' 'ucloud-git')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/ucloud/ucloud-cli/releases/download/v${pkgver}/ucloud-linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/ucloud/ucloud-cli/releases/download/v${pkgver}/ucloud-linux_arm64.zip")
sha256sums_x86_64=('e40fc12dd2b7e5445ce12b02c22b5afb2e05ca9910e066760ad925ee756bbd5f')
sha256sums_aarch64=('af37de4f26b16d7b8af833faa072d721545687997dc2cae8e646d1be741b6145')

package() {
  install -Dm755 bin/ucloud "${pkgdir}/usr/bin/ucloud"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
