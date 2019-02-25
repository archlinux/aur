# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('zsh-you-should-use')
pkgname=('zsh-you-should-use')
_module='zsh-you-should-use'
pkgver='1.1.0'
pkgrel=1
pkgdesc='ZSH plugin that reminds you to use existing aliases for commands you just typed'
url='https://github.com/MichaelAquilina/zsh-you-should-use'
depends=(
)
makedepends=()
arch=('any')
license=('GPL3')
source=('https://github.com/MichaelAquilina/zsh-you-should-use/archive/1.1.0.tar.gz')
install="${pkgname}.install"
sha256sums=('c858f62e014ea5d6a9483ba97eeaf18c31c11e3e8b3b4f8e5d4182ce46eb9188')


package() {
    install -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/you-should-use.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

    # License
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
