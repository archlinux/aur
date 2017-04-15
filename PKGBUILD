# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=fcitx-skin-hakurei-reimu
pkgver=1.0
pkgrel=1
pkgdesc="Hakurei Reimu - fcitx skin"
arch=('any')
url="https://github.com/fcitx/fcitx-artwork/tree/master/skin/Hakurei%20Reimu"
license=('custom')
depends=('fcitx')
makedepends=('git')
source=("git+https://github.com/fcitx/fcitx-artwork.git")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/fcitx-artwork/skin"

    find "Hakurei Reimu" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/fcitx/skin/{}" \;
}
