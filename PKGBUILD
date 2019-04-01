# Maintainer: Ron Asimi <ron.asimi@gmail.com>
pkgname=interui-otf
pkgver=3.4
pkgrel=1
pkgdesc='Inter UI is a typeface specially designed for user interfaces with focus on high legibility of small-to-medium sized text on computer screens.'
arch=('any')
url='https://rsms.me/inter/'
license=('custom:SIL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-${pkgver}.zip"
        "https://raw.githubusercontent.com/rsms/inter/master/LICENSE.txt")
sha256sums=('2383b056882f896fa3ed3ee905fda0e43f7316e68ab1b12e3a9a700803967898'
            'cc36dd53b88f8c7f138b9708e0c4b598816e4e52c7e252859e67e1e7edbcf117')
package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 "${srcdir}/Inter (OTF)/"*.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
