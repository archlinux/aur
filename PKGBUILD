# Maintainer: Max Davydovsky <max.davydovsky@gmail.com>

pkgname=ttf-pacifico
pkgver=3.000
pkgrel=2
pkgdesc="Pacifico is an original and fun brush script handwriting font by Vernon Adams which was inspired by the 1950s American surf culture. It was redrawn by Jacques Le Bailly and expanded to Cyrillic by Botjo Nikoltchev and Ani Petrova."
arch=('any')
url="https://fonts.google.com/specimen/Pacifico"
license=('OFL')
depends=('fontconfig')
source=('Pacifico-Regular.ttf::https://raw.githubusercontent.com/googlefonts/Pacifico/master/fonts/Pacifico-Regular.ttf'
        'OFL.txt::https://raw.githubusercontent.com/googlefonts/Pacifico/master/OFL.txt')
sha256sums=('5b6c0d5334a7bf77dea52b975c5a0c408878c0f7115ed5b6fb151f634b7bf701'
            'a47e5daeda73568969395c656823102678f2eefb0d7d7ecb47aac4cc17e42204')

package() {
    install -d $pkgdir/usr/share/fonts/TTF/
    install -m644 $srcdir/Pacifico-Regular.ttf $pkgdir/usr/share/fonts/TTF/
    install -Dm644 $srcdir/OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
