# CO-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.169
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
sha256sums_aarch64=('eada5124a99da7554f125c1913d43b06de4a280a395d98303ee441b360da7c17')
sha256sums_armv7h=('eada5124a99da7554f125c1913d43b06de4a280a395d98303ee441b360da7c17')
sha256sums_x86_64=('348debdea1de14534dba9fc354feff252341410427bef5935876a200cdbcd5fa')

package() {
    install -Dm 755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}