# CO-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.183
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
sha256sums_aarch64=('9dc07a61e4353acda2baa69a50f4194d57eae0922f706a25aecba570ea9937a5')
sha256sums_armv7h=('9dc07a61e4353acda2baa69a50f4194d57eae0922f706a25aecba570ea9937a5')
sha256sums_x86_64=('18d968ed8893992869d0c126d793885a8d22e99cb098e41eadffb6714155fd02')
package() {
    install -Dm755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}