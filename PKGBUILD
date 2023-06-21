# CO-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.167
pkgrel=1
pkgdesc="A tool to manage and use Alibaba Cloud resources through a command line interface"
url="https://github.com/aliyun/aliyun-cli"
conflicts=("${pkgname%-cli-bin}")
depends=('glibc')
provides=("${pkgname%-cli-bin}")
license=('Apache')
arch=('aarch64' 'armv7h' 'x86_64')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.tgz")
sha256sums_aarch64=('d54368504a5a98f328b896412aa421d5374f16c20a1bfdd965dac3082dd0cb08')
sha256sums_armv7h=('d54368504a5a98f328b896412aa421d5374f16c20a1bfdd965dac3082dd0cb08')
sha256sums_x86_64=('d5b192ae7548b8e87beb5de8bc4bb432a29318634b6ee166fc93cdfff3652848')

package() {
    install -Dm 755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}