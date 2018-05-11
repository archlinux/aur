# Maintainer: Jonathan Sumner Evans <sumner.evans98@gmail.com>

pkgname="zsh-you-should-use"
pkgver=0.4.3
pkgrel=2
pkgdesc="ZSH plugin that reminds you to use existing aliases for commands you just typed"
url="https://github.com/MichaelAquilina/zsh-you-should-use"
arch=("any")
license=("GPL3")
source=("https://github.com/MichaelAquilina/${pkgname}/archive/${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("97f6d1ae9ba15e6781c288c9682834161132a9172bab2f2ac1c15875dce4e7a0")

package() {
    install -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/you-should-use.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

    # License
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
