# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=gulzar
pkgbase=$_fname-font
pkgname=(ttf-$_fname)
pkgver=1.002
pkgrel=1
pkgdesc='a Nastaliq font for Urdu text with a typographic, rather than calligraphic feel'
arch=(any)
url='https://gulzarfont.org'
license=(OFL)
_archive="${_fname^}-$pkgver"
source=("https://github.com/googlefonts/${_fname^}/releases/download/${_fname^}-v$pkgver/$_archive.zip")
sha256sums=('5e2a5f5517e76897170e5dd034022e11fa06243a0fe00d13321b32801234a31c')

package_ttf-gulzar() {
    provides=("$pkgbase")
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ${_fname^}-*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" DESCRIPTION.en_us.html
}
