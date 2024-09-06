# Contributor: Artem Stasyuk <stasyukartem2@gmail.com>
# Maintainer: Artem Stasyuk <stasyukartem2@gmail.com>

pkgname=ttf-aptos
pkgver=1.1
pkgrel=0
pkgdesc="The new default Microsoft 365 font, used by Microsoft"
arch=('any')
url="https://learn.microsoft.com/en-us/typography/font-list/aptos"
license=('custom')
source=("https://download.microsoft.com/download/8/6/0/860a94fa-7feb-44ef-ac79-c072d9113d69/Microsoft%20Aptos%20Fonts.zip")
sha256sums=('6528fd120e719a9f985e94214eca6887d1653b88456916a792a630b02e95b025')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
    install -Dm644 "${srcdir}/Microsoft Aptos Fonts EULA.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf"
}
