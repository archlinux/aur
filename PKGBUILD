# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=roadgeek2005-fonts
pkgver=2.0
pkgrel=1
pkgdesc="Michael Adams’ obsessively-detailed clones of highway signage typefaces used in America, Germany and the UK"
arch=(any)
url=http://miketheactuary.wordpress.com/roadgeek-fonts/
license=(custom)
conflicts=('otf-roadgeek2005')
source=('https://sites.google.com/a/triskele.com/foo/home/bar/roadgeek2005v2-complete.zip')
sha256sums=('c76212942b8ef22db003f0eae247fff92751f405ec9b2cf582fcc457b2bd9731')
sha512sums=('0e9d4158c1a5948cb5a71399977b5c8fa66f891aff645cd091cb23148bad801713f9cc764c10314ccf77581dc867d248997f852276f46b1f4a4a8988b7af00cd')

package() {
    find -name '*.otf' -exec install -Dm644 '{}' "${pkgdir}"/usr/share/fonts/roadgeek2005/'{}' \;
    install -Dm644 'License for use of Roadgeek Fonts.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
