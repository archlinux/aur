# Maintainer:
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgbase=estedad-fonts
pkgname=(ttf-estedad ttf-estedad-variable)
pkgver=8.5
pkgrel=1
pkgdesc="A Sans Serif Arabic-Latin text typeface"
arch=('any')
url="https://github.com/aminabedi68/Estedad"
license=('OFL-1.1')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Estedad-v${pkgver}.zip"
        "${pkgbase}-LICENSE::${url}/raw/master/OFL.txt")
sha256sums=('e780f2c9527e9d9f673b61f1e093c17d6e217c1e4be15a957bb287e13344728e'
            '0417da48fc44780476e074f02f8400028ee704b3e222be5855fa6d960b9200ca')

package_ttf-estedad() {
    cd "Estedad-v${pkgver}"
    install -Dm644 Statics/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${pkgbase}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-estedad-variable() {
    cd "Estedad-v${pkgver}"
    install -Dm644 Estedad[wght].ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${pkgbase}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
