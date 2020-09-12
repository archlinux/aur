# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=otf-inconsolata-dz
pkgver=20200912
pkgrel=1
pkgdesc="Monospace font for pretty code listings and for the terminal (modified to have straight single and double quotes)"
arch=('any')
url="http://nodnod.net/2009/feb/12/adding-straight-single-and-double-quotes-inconsola/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-mkfontscale')
provides=('ttf-font')
source=('https://nodnod.net/posts/inconsolata-dz/files/Inconsolata-dz.otf'
        'OFL.txt')
install=otf-inconsolata-dz.install
sha256sums=('04e0821b13941dca2df582ea16ff146d848bbb6fc0171d7c714e2c7bc471947f'
            'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3')

package() {
    install -Dm644 $srcdir/Inconsolata-dz.otf $pkgdir/usr/share/fonts/OTF/ttf-inconsolata-dz.otf
    install -Dm644 $srcdir/OFL.txt $pkgdir/usr/share/licenses/ttf-inconsolata-dz/OFL.txt
}
