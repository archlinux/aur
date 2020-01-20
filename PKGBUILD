# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='zsh-you-should-use'
pkgname=('zsh-you-should-use')
_module='zsh-you-should-use'
pkgver='1.6.1'
pkgrel=1
pkgdesc='ZSH plugin that reminds you to use existing aliases for commands you just typed'
url='https://github.com/MichaelAquilina/zsh-you-should-use'
depends=(
)
makedepends=()
arch=('any')
license=('GPL3')
source=('https://github.com/MichaelAquilina/zsh-you-should-use/archive/1.6.1.tar.gz')
install="${pkgname}.install"
sha256sums=('51d38ce62f06ae0b5c73dde94a52919448ffb37bbd9c86e57532f77b09d113f1')


package() {
    install -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/you-should-use.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

    # License
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
