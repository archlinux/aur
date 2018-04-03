# Maintainer: Jonathan Sumner Evans <sumner.evans98@gmail.com>

pkgname="zsh-you-should-use"
pkgver=0.4.2
pkgrel=2
pkgdesc="ZSH plugin that reminds you to use existing aliases for commands you just typed"
url="https://github.com/MichaelAquilina/zsh-you-should-use"
arch=("any")
license=("GPL3")
source=("https://github.com/MichaelAquilina/${pkgname}/archive/${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("5db7415e16c914fb38e4dc48e4d17f5d4ac5ac5c38135484cf98d4dc31fb6338")

package() {
    install -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/you-should-use.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

    # License
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
