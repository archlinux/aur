# Maintainer: Ron Asimi <ron.asimi@gmail.com>
pkgname=interui-ttf-hinted
pkgver=3.1
pkgrel=1
pkgdesc='Inter UI is a typeface specially designed for user interfaces with focus on high legibility of small-to-medium sized text on computer screens.'
arch=('any')
url='https://rsms.me/inter/'
license=('custom:SIL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-UI-${pkgver}.zip"
        "https://raw.githubusercontent.com/rsms/inter/master/LICENSE.txt")
sha256sums=('07e25f3e9a1a156db36a383213c0b753fb3099c55ee84f7b0eeddbd77a7c8eca'
            '40cc017183821b3163b4ab30c186019f05573323fdacb1cd9563c97098f8183c')
package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 "${srcdir}/Inter UI (TTF hinted)/"*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
