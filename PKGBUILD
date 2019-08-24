# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=fcitx-skin-aqua
pkgver=0.1
pkgrel=1
pkgdesc='Fcitx Skin - Aqua'
arch=('any')
url="https://github.com/redchenjs/fcitx-skin-aqua/"
license=('Apache')
depends=(
    'fcitx'
)
source=(
    'https://github.com/redchenjs/fcitx-skin-aqua/archive/v'${pkgver}'.tar.gz'
)
md5sums=(
    'e70a968d9800d408a687bba7c18d9b4e'
)

package() {
    install -dm755 "${pkgdir}"/usr/share/fcitx/skin/aqua/
    install -Dm644 "${srcdir}"/fcitx-skin-aqua-"${pkgver}"/aqua/* \
                   "${pkgdir}"/usr/share/fcitx/skin/aqua/
}
