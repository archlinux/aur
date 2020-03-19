# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=ttf-sbl-hebrew
pkgver=1.56a_Build016
pkgrel=2
pkgdesc='Society of Biblical Literature’s Hebrew font'
arch=('any')
url='https://www.sbl-site.org/educational/BiblicalFonts_SBLHebrew.aspx'
license=('custom')
source=('https://www.sbl-site.org/Fonts/SBL_Hbrw.ttf'
        'LICENSE')
sha256sums=('98eca8ecc97af984e205c282d6a0e994af41612029e49a223e85677b71cf9e99'
            'a788cd2cf15ddb83bcf0129e006fb77270cd72c15c3fda3c0b88558af7dcc5bb')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" SBL_Hbrw.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
