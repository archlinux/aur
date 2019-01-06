# Maintainer: Ron Asimi <ron.asimi@gmail.com>
pkgname=interui-ttf-hinted
pkgver=3.2
pkgrel=1
pkgdesc='Inter UI is a typeface specially designed for user interfaces with focus on high legibility of small-to-medium sized text on computer screens.'
arch=('any')
url='https://rsms.me/inter/'
license=('custom:SIL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-UI-${pkgver}.zip"
        "https://raw.githubusercontent.com/rsms/inter/master/LICENSE.txt")
sha256sums=('0506710f690e72a6eff616acace084d2705e4d22d4394be9448742c6e295632b'
            '40cc017183821b3163b4ab30c186019f05573323fdacb1cd9563c97098f8183c')
package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 "${srcdir}/Inter UI (TTF hinted)/"*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
