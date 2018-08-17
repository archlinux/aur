# Maintainer: Jonathan Sumner Evans <sumner.evans98@gmail.com>

pkgname="zsh-you-should-use"
pkgver=0.5.0
pkgrel=1
pkgdesc="ZSH plugin that reminds you to use existing aliases for commands you just typed"
url="https://github.com/MichaelAquilina/zsh-you-should-use"
arch=("any")
license=("GPL3")
source=("https://github.com/MichaelAquilina/${pkgname}/archive/${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("d41f1cbfba03d6f446d2e19f7b758fe81e154dd9287415699c2438c450c144c3")

package() {
    install -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/you-should-use.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

    # License
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
