pkgname=ttf-tamil
pkgver=1.0
pkgrel=2
pkgdesc="TTF tamil fonts from The Tamil Linux Project."
arch=('any')
url="http://tamillinux.sourceforge.net/"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
source=("ttf-tamil.tgz::https://sourceforge.net/projects/tamillinux/files/tamil_opentype_fonts/$pkgver/tamil_opentype_fonts-$pkgver.tgz/download")
sha256sums=('2771ca603fb02520cb1ea2dac10400fd4f512d7a8883a7ecffefe6595a93dcf5')
install=$pkgname.install

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 "$srcdir/tamil_opentype_fonts/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -Dm644 "$srcdir/tamil_opentype_fonts/README" "$pkgdir/usr/share/licenses/$pkgname/README"
}
