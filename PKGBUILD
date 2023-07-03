# CO-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.168
pkgrel=1
pkgdesc="A tool to manage and use Alibaba Cloud resources through a command line interface"
url="https://github.com/aliyun/aliyun-cli"
conflicts=("${pkgname%-cli-bin}")
depends=('glibc')
provides=("${pkgname%-bin}")
license=('Apache')
arch=('aarch64' 'armv7h' 'x86_64')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.tgz")
sha256sums_aarch64=('fe4a32a92792cd844eb2a9c2dd0398172b7353f2aeb22f24434117fde1dcc061')
sha256sums_armv7h=('fe4a32a92792cd844eb2a9c2dd0398172b7353f2aeb22f24434117fde1dcc061')
sha256sums_x86_64=('57937b7cffdb10a8171f7c32b7dd2e48ac1bd2e2c475bb98cf6425814dbeb11d')

package() {
    install -Dm 755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}