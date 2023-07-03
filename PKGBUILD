# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="wolai-bin"
pkgver=1.2.7
pkgrel=3
pkgdesc="wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生产力工具。"
arch=("aarch64" "armv7h" "x86_64")
url="https://www.wolai.com"
license=('freeware')
depends=('hicolor-icon-theme' 'libcups' 'nss' 'cairo' 'libxdamage' 'libxfixes' 'pango' 'libxext' 'gtk3' 'libxcomposite' 'nspr' \
    'libdrm' 'gcc-libs' 'libxcb' 'libx11' 'expat' 'glibc' 'libxrandr' 'libxkbcommon' 'mesa' 'glib2' 'at-spi2-core' 'dbus' 'alsa-lib')
provides=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("LICENSE::${url}/${pkgname%-bin}/q5eyV15yEQPxBhjnFXyWtL")
sha256sums=('b0fbfbf99f5c160ad9d4f18a7ea8257c405dc631e11e3e8f77e17bc983e53f5a')
sha256sums_aarch64=('6ecf889f2d0dbd0630617d56ee233ae71214663d1f01c16b160fda02c21506d7')
sha256sums_armv7h=('6ecf889f2d0dbd0630617d56ee233ae71214663d1f01c16b160fda02c21506d7')
sha256sums_x86_64=('c6dadbc374f9d536a8cf039d748b0e5eb74a90e3b6630abb787d5c0442e78469')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}