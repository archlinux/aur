# Maintainer: damir <sudo pacman at gmail com>

pkgname=ttf-shanggu-variable
pkgver=1.022
pkgrel=1
pkgdesc="Calligraphic CJK font based on Source-Han-Sans in variable TTF format"
arch=('any')
url="https://github.com/GuiWonder/Shanggu"
license=('OFL-1.1')
provides=('ttf-font')
source=("${url}/releases/download/${pkgver}/ShangguSans-VF_OTCTTC.7z"
        "${url}/releases/download/${pkgver}/ShangguSerif-VF_OTCTTC.7z")
md5sums=('46f704c44cccfda078f82fc096bbed92'
         '7443181fb2d23f0590c9b5a2c79299dd')
         
package() {
    install -Dm644 *.ttc -t "${pkgdir}/usr/share/fonts/shanggu/"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
