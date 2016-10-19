# Maintainer: Kars Wang <jaklsy g-mail>

_font_name=umeplus-cl
pkgname="ttf-$_font_name"
pkgver=20160402
pkgrel=1
pkgdesc='UmePlus CL fonts are modified Ume CL and M+ fonts for Japanese.'
url='http://www.geocities.jp/ep3797/modified_fonts_01.html'
license=('custom')
arch=('any')
depends=('fontconfig')
install="fonts.install"
source=("http://iij.dl.osdn.jp/users/10/10367/umeplus-cl-fonts-$pkgver.tar.xz")
sha256sums=('1c0a2cd01dca6c06da202afb9a56b3c367e8a5639724d17f4e4e611d20741a2b')

package() {
    cd "$srcdir/umeplus-cl-fonts-$pkgver"
    install -d "$pkgdir/usr/share/fonts/$_font_name"
    install -t "$pkgdir/usr/share/fonts/$_font_name" -m644 *.ttf
    install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
