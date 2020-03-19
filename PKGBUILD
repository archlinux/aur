# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=ttf-sbl-greek
pkgver=1.00_Build010
pkgrel=2
pkgdesc='Socienty of Biblical Literature’s Greek font'
arch=('any')
url='https://www.sbl-site.org/educational/BiblicalFonts_SBLGreek.aspx'
license=('custom')
source=('https://www.sbl-site.org/Fonts/SBL_grk.ttf'
        'LICENSE')
sha256sums=('cbf8b1a87a4a311e2aa9b5b2995f83b23159fbe0ca9ca517d3fd43b5911e925a'
            'a788cd2cf15ddb83bcf0129e006fb77270cd72c15c3fda3c0b88558af7dcc5bb')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" SBL_grk.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
