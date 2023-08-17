# CO-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.174
pkgrel=1
pkgdesc="A tool to manage and use Alibaba Cloud resources through a command line interface"
url="https://github.com/aliyun/aliyun-cli"
arch=('aarch64' 'armv7h' 'x86_64')
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-cli-bin}" "${pkgname%-bin}")
depends=('glibc')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.tgz")
sha256sums_aarch64=('7688210bba75aad8e7d69ab34184b0704ea79f12080ed3cc3bc21a4e4d085653')
sha256sums_armv7h=('7688210bba75aad8e7d69ab34184b0704ea79f12080ed3cc3bc21a4e4d085653')
sha256sums_x86_64=('0c51028a7a32fc02c8de855f73e273556f957115eb5624565738f9b9f83a50ba')
package() {
    install -Dm 755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}