# Maintainer: duckmercury
# Contributor: Gordon Chan <gc@gondro.xyz>

pkgname=ttf-shanggu
pkgver=1.021
pkgrel=1
pkgdesc="Shanggu Fonts"
arch=(any)
url="https://github.com/GuiWonder/Shanggu"
license=('OFL-1.1')
provides=('ttf-font')
source=("${url}/releases/download/${pkgver}/ShangguMonoOTCs.7z"
        "${url}/releases/download/${pkgver}/ShangguSansOTCs.7z"
        "${url}/releases/download/${pkgver}/ShangguSerifOTCs.7z"
        "${url}/releases/download/${pkgver}/ShangguRoundTTCs.7z"
        "70-shanggu.conf")


md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
    install -Dm644 *.ttc -t "${pkgdir}/usr/share/fonts/shanggu/"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/70-shanggu.conf" -t "${pkgdir}/usr/share/fontconfig/conf.avail/"
}
