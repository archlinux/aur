# Maintainer: Ron Asimi <ron.asimi@gmail.com>
pkgname=interui-otf
pkgver=3.9
pkgrel=1
pkgdesc='Inter UI is a typeface specially designed for user interfaces with focus on high legibility of small-to-medium sized text on computer screens.'
arch=('any')
url='https://rsms.me/inter/'
license=('custom:SIL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-${pkgver}.zip"
        "https://raw.githubusercontent.com/rsms/inter/master/LICENSE.txt")
sha256sums=('445f71a2c6d0a64c11649533346ded15eb28c1be97b5866910f786da78ab4dbb'
            'e68284465dffb78145848f2c2e466add3a8f1025788497e95e090f06e5bc19a4')
package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 "${srcdir}/Inter (OTF)/"*.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
