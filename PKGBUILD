# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('zsh-you-should-use')
pkgname=('zsh-you-should-use')
_module='zsh-you-should-use'
pkgver='0.6.0'
pkgrel=1
pkgdesc='ZSH plugin that reminds you to use existing aliases for commands you just typed'
url='https://github.com/MichaelAquilina/zsh-you-should-use'
depends=(
)
makedepends=()
arch=('any')
license=('GPL3')
source=('https://github.com/MichaelAquilina/zsh-you-should-use/archive/0.6.0.tar.gz')
install="${pkgname}.install"
sha256sums=('c1c16c0bc339c6212748798528c1c62703dce86cd0381ef2ec6e115abc45e6fc')


package() {
    install -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/you-should-use.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

    # License
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
