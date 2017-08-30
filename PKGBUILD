# Contributor: orumin <dev@orum.in>

pkgname=otf-kingen
pkgver=1.000
pkgrel=2
pkgdesc="Japanese OpenType font obtained by mixing old style kana character font and Adobe Source Han Serif JP"
arch=('any')
url="http://www.akenotsuki.com/eyeben/fonts/kingen.html"
license=('custom:SIL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=otf.install
source=("http://www.akenotsuki.com/eyeben/fonts/files/kingen1_000.zip"
        "https://raw.githubusercontent.com/adobe-fonts/source-han-sans/master/LICENSE.txt")
sha256sums=('aaadd5190b67d46d0df3c14369307486ea50fd6600629972e0d652b1794a1875'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')

package() {
    cd "${srcdir}"

    install -Dm644 kingen.otf "${pkgdir}/usr/share/fonts/OTF/kingen.otf"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/otf-kingen/LICENSE.txt"
}
