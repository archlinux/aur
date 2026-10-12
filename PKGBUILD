# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>pkgname=localtranslate

pkgname=localtranslate-models-official
pkgver=0.5.0
pkgrel=2
pkgdesc="Official translation models for LocalTranslate (Firefox)"
arch=("any")
url="https://github.com/terslang/LocalTranslate"
license=('MPL-2.0')
provides=("localtranslate-models-base")
conflicts=("localtranslate-models-base")
source=("$url/releases/download/v$pkgver/firefox-models.tar.xz")
sha256sums=('5e773a3b00ea4a6d3b9e27162c86c9a6646cb11603397a2d560f95bf2ca8f59d')

package() {
    install -d "${pkgdir}/usr/share/localtranslate/models"
    tar -xf "${srcdir}/firefox-models.tar.xz" \
        -C "${pkgdir}/usr/share/localtranslate/models"
}
