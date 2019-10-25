# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=fcitx-skin-aqua
pkgver=0.1
pkgrel=2
pkgdesc='Fcitx Skin - Aqua'
arch=('any')
url='https://github.com/redchenjs/fcitx-skin-aqua/'
license=('Apache')
depends=(
    'fcitx'
)
source=(
    'https://github.com/redchenjs/fcitx-skin-aqua/archive/v'${pkgver}'.tar.gz'
)
md5sums=(
    '126d58f4a094c31c775d2341b8c65afe'
)

package() {
    install -dm 755 ${pkgdir}/usr/share/fcitx/skin/aqua/
    install -Dm 644 ${srcdir}/fcitx-skin-aqua-${pkgver}/aqua/* \
                    ${pkgdir}/usr/share/fcitx/skin/aqua/
}
