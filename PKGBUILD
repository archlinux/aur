# CO-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.182
pkgrel=1
pkgdesc="A tool to manage and use Alibaba Cloud resources through a command line interface"
url="https://github.com/aliyun/aliyun-cli"
arch=('aarch64' 'armv7h' 'x86_64')
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-cli-bin}" "${pkgname%-bin}")
depends=('glibc>=2.38')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.tgz")
sha256sums_aarch64=('e97d4516313bb4bb7f878696555527860ef3542d654a14e269cb0a1ca4a0137c')
sha256sums_armv7h=('e97d4516313bb4bb7f878696555527860ef3542d654a14e269cb0a1ca4a0137c')
sha256sums_x86_64=('abe91aa8ebf971df9aeea5ffa59406ba889a6a219dc50c1e61f27c5e93056d0a')
package() {
    install -Dm 755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}