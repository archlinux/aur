# Maintainer: Ron Asimi <ron.asimi@gmail.com>
pkgname=interui-ttf-hinted
pkgver=3.3
pkgrel=1
pkgdesc='Inter UI is a typeface specially designed for user interfaces with focus on high legibility of small-to-medium sized text on computer screens.'
arch=('any')
url='https://rsms.me/inter/'
license=('custom:SIL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-UI-${pkgver}.zip"
        "https://raw.githubusercontent.com/rsms/inter/master/LICENSE.txt")
sha256sums=('b8733799800cedbc5459944ce48fbb8bb0b8fa674a865cd7359bfbaa0038fb0c'
            'cc36dd53b88f8c7f138b9708e0c4b598816e4e52c7e252859e67e1e7edbcf117')
package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 "${srcdir}/Inter UI (TTF hinted)/"*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

