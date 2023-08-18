# CO-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.176
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
sha256sums_aarch64=('eb634eacf58e8dac6c84ebaaa7b537b2ce24f834b52998d107e083549ed93836')
sha256sums_armv7h=('eb634eacf58e8dac6c84ebaaa7b537b2ce24f834b52998d107e083549ed93836')
sha256sums_x86_64=('3ff6560cd9c48af6d694b42dfecda22a01850702997de78a0563c40c9f35bc3e')
package() {
    install -Dm 755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}