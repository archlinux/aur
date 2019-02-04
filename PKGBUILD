# Maintainer: Ron Asimi <ron.asimi@gmail.com>
pkgname=interui-otf
pkgver=3.3
pkgrel=1
pkgdesc='Inter UI is a typeface specially designed for user interfaces with focus on high legibility of small-to-medium sized text on computer screens.'
arch=('any')
url='https://rsms.me/inter/'
license=('custom:SIL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-UI-${pkgver}.zip"
        "https://raw.githubusercontent.com/rsms/inter/master/LICENSE.txt")
sha256sums=('cc36dd53b88f8c7f138b9708e0c4b598816e4e52c7e252859e67e1e7edbcf117'
            'cc36dd53b88f8c7f138b9708e0c4b598816e4e52c7e252859e67e1e7edbcf117')
package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 "${srcdir}/Inter UI (OTF)/"*.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
