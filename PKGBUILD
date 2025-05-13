# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goodlink-bin
_pkgname=GoodLink
pkgver=2.1.8
pkgrel=1
pkgdesc="The simplest, zero-cost intranet penetration in the whole network, a single command directly connects any two hosts on the Internet.(Prebuilt version,written in Go)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://gitee.com/konyshe/goodlink"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64-cmd.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm-cmd.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-386-cmd.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-cmd.zip")
sha256sums_aarch64=('442498b18d1eba94a4cba1732351e58f63ae92ea55de13c7cfeba7c3d4a10c86')
sha256sums_armv7h=('b13d6b3e5937732b0f0cfd900c4dc19b6cd69d9b636be0a26011980fdf2467c5')
sha256sums_i686=('cce28ac7592734b7993c536f204196e32a21c6510225af47477b0eca536efe2a')
sha256sums_x86_64=('c70b4cf6c4217034868f3f60cdbdfd237276e85e0717c722f0ad3d2eb14e771a')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-linux-"*-cmd "${pkgdir}/usr/bin/${pkgname%-bin}"
}