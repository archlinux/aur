# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=shellcheck-bin
pkgver=0.7.2
pkgrel=1
url='https://shellcheck.net'
pkgdesc='Shell script analysis tool (binary release)'
license=(AGPL3)
arch=(x86_64 armv6h aarch64)
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")

source_x86_64=(https://github.com/koalaman/"${pkgname%-bin}"/releases/download/v"$pkgver"/"${pkgname%-bin}"-v"${pkgver}".linux.x86_64.tar.xz)
source_armv6h=(https://github.com/koalaman/"${pkgname%-bin}"/releases/download/v"$pkgver"/"${pkgname%-bin}"-v"${pkgver}".linux.armv6hf.tar.xz)
source_aarch64=(https://github.com/koalaman/"${pkgname%-bin}"/releases/download/v"$pkgver"/"${pkgname%-bin}"-v"${pkgver}".linux.aarch64.tar.xz)

sha512sums_x86_64=('067e2b8ee1910218de1e62068f7cc86ed7048e97b2a9d7c475ea29ae81c17a944376ce5c240d5c783ef3251d9bee7d7d010351958314eadd0fc88b5decfd8328')
sha512sums_armv6h=('e4978167122178ed5d3475d7632bfc55331f412915f832c96118a436dd656ecdc47ec99c724643de3c091a5132c43b851e52f6d987aa4d39ef29e797b538e274')
sha512sums_aarch64=('467cc6455d665638e7803a36f1be65ccfb9dc92c5573b143110e8e259e50fb2213b8346fdef43bbd3e6077ec4d78fd6c30e678c96f472e6f056448b43834f7dc')


package() {
    install -Dm755 "${pkgname%-bin}-v${pkgver}/${pkgname%-bin}" -t "${pkgdir}/usr/bin" 
}
