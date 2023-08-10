# CO-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.170
pkgrel=2
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
sha256sums_aarch64=('4abbab1029c695269e579871b90a2daf83386a112c67cd6e70b08f05e84d6d23')
sha256sums_armv7h=('4abbab1029c695269e579871b90a2daf83386a112c67cd6e70b08f05e84d6d23')
sha256sums_x86_64=('2d47595d840c7f2872c508810f18680eff80e40d85ca9647bd041b4176ade0cd')
package() {
    install -Dm 755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}