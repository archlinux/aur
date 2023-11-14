# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=hoverfly-bin
pkgver=1.6.0
pkgrel=2
pkgdesc="Lightweight service virtualization/API simulation tool for developers and testers"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url='https://hoverfly.io'
_ghurl="https://github.com/SpectoLabs/hoverfly"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_arm64.zip")
source_i686=("${pkgname}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_386.zip")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_amd64.zip")
sha256sums_aarch64=('3ed1eaecc7d8343c844078a666ddcf148be354171fa0a3078cf10d97f9583d37')
sha256sums_armv7h=('3ed1eaecc7d8343c844078a666ddcf148be354171fa0a3078cf10d97f9583d37')
sha256sums_i686=('b9d028962598d7a19a725f86d62c8bd45cb4285d5eb421e3df8488bbb92eae46')
sha256sums_x86_64=('8d7d2970975fea52265ce6230d1c2e42222b76847650410577421fa52a25bab1')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/hoverctl" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}