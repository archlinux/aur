# Maintainer: Ron Asimi <ron.asimi@gmail.com>
pkgname=interui-ttf-hinted
pkgver=3.7
pkgrel=1
pkgdesc='Inter UI is a typeface specially designed for user interfaces with focus on high legibility of small-to-medium sized text on computer screens.'
arch=('any')
url='https://rsms.me/inter/'
license=('custom:SIL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-${pkgver}.zip"
        "https://raw.githubusercontent.com/rsms/inter/master/LICENSE.txt")
sha256sums=('0eb097467954991e109d179e22f06b11ef462e632dac5ce65633aa6e7262fa40'
            'e68284465dffb78145848f2c2e466add3a8f1025788497e95e090f06e5bc19a4')
package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 "${srcdir}/Inter (TTF hinted)/"*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

