# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-ss06-super
pkgver=17.0.1
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/super-ttc-iosevka-ss06-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('e976c25284fe3f78700a3aae954f920c375244f549c37b1b602c385d838b3220'
            '46ecadda73abf39cda76731a94fd357b743f882dc1156b4410a2967a811c4ff1')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
