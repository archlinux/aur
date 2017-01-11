# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-signika
pkgver=1.000
pkgrel=1
pkgdesc='Sans-serif typeface from Google by Anna Giedryś'
arch=('any')
url='https://fonts.google.com/specimen/Signika'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git')
install="${pkgname}.install"
source=('https://github.com/google/fonts/raw/master/ofl/signika/Signika-Bold.ttf'
        'https://github.com/google/fonts/raw/master/ofl/signika/Signika-Light.ttf'
        'https://github.com/google/fonts/raw/master/ofl/signika/Signika-Regular.ttf'
        'https://github.com/google/fonts/raw/master/ofl/signika/Signika-Semibold.ttf'
        'https://github.com/google/fonts/raw/master/ofl/signika/OFL.txt')
sha256sums=('05ade73378781a76af64719105dcf5a88e15ab8c2fbae3ce4cee30fe9389e41b'
            '29de923396dc25a54703d3bdb2729a3e738da67ae9bee7d1ae2bdb5afac399e0'
            'b2cb0e5422d45195af4b7234c5692b57095ea193fcd8b5ee710fea09b12c89d2'
            '462a38a1f913db33dc07c76ef522c2c40d6aaa4aaa2f3c61398ece9f36546028'
            '1ba345a91338581e5f8fccc3e37e447ddea5b99ec9caec1b76c7c39492387d2f')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 *.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
