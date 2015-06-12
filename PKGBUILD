# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=misti-fonts
pkgver=2014
pkgrel=3
pkgdesc="Misti's fonts (ttf)"
arch=('any')
url="http://mistifonts.com/"
license=('free for personal use')
depends=('fontconfig' 'xorg-font-utils')
install=misti.install
source=('http://mistifonts.com/all%20fonts/all%20misti%27s%20fonts.zip'
        'Terms.txt'
        'misti.install')
md5sums=('5b4fb253f92ee23b57521f6b87aecdd1'
         'cc9d7b475c85b4c662fc23e6b43ece8c'
         'a1a8cdd720dc8b3e1129714b72440610')

package() {
    install -Dm644 Terms.txt "$pkgdir"/usr/share/licenses/$pkgname/Terms
    mkdir -p "$pkgdir"/usr/share/fonts/TTF/
    install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}

