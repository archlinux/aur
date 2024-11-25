pkgname=ttf-pacifico
pkgver=3.000
pkgrel=3
pkgdesc="Pacifico is an original and fun brush script handwriting font by Vernon Adams which was inspired by the 1950s American surf culture. It was redrawn by Jacques Le Bailly and expanded to Cyrillic by Botjo Nikoltchev and Ani Petrova."
arch=('any')
url="https://fonts.google.com/specimen/Pacifico"
license=('OFL')
source=(
  'Pacifico-Regular.ttf::https://raw.githubusercontent.com/googlefonts/Pacifico/main/fonts/ttf/Pacifico-Regular.ttf'
  'LICENSE::https://raw.githubusercontent.com/googlefonts/Pacifico/master/OFL.txt'
)
sha256sums=('8f5fe7b9ef94bc4ef893c7a47b61681a1a1854584e126b3386fd6b64fba21a2a'
            'b2c3d47737b9e48d47d0e925dcf6f5995fe802e2634384bdf7894200832a7158')

package() {
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/Pacifico-Regular.ttf $pkgdir/usr/share/fonts/TTF/
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
