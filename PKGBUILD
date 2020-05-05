# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Brendan Clarke <b at d3x dot me>
pkgname=('otf-bender')
_basename=Bender
pkgver=1.0.0
pkgrel=1
pkgdesc='Bender font by Jovanny Lemonad'
arch=('any')
url='https://www.1001fonts.com/bender-font.html'
license=('OFL')
source=("$pkgname-$pkgver.zip::https://dl.1001fonts.com/bender.zip")
sha512sums=('fbe9e9af1a238e2d94916ad9a8091f50fda49fc7b258829d5c41542d6b56f94e5c13dfc206a8b23ba609a2760a05b4ed00cb17f189c03a13777185c4086e0ecd')

package(){
    cd "$_basename"
    mv 'FREE FONT LICENSE.txt' 'OFL.txt'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "OFL.txt"
    install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" *.otf
}
