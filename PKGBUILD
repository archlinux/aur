# Maintainer: Florian Albertz <flo.albertz@gmail.com>
pkgname="ttf-profont-iix"
pkgver="1.0.0"
pkgrel=2
pkgdesc='Profont IIx Variant as a Truetype Font'
arch=('any')
url='http://tobiasjung.name/profont/'
license=('MIT')
depends=(fontconfig xorg-font-utils)
source=('http://tobiasjung.name/downloadfile.php?file=profontiix.zip')
sha256sums=('9d118ffd8f80e8b9952d2ae24d13d89149ebb5e9459b9e2a2cc33e1a460c1bfa')
install=$pkgname.install

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 "$srcdir/profontiix/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
