# Maintainer: Les De Ridder <aur@lesderid.net>
pkgname=ttf-comic-relief
pkgver=1.1
pkgrel=1
pkgdesc="Comic Relief font (TTF)"
arch=('any')
url="http://loudifier.com/comic-relief/"
license=('custom:SIL')
depends=('fontconfig')
source=('comic-relief.zip')
sha512sums=('769f49f4e7f173bae66d748c83a469769bfab3efd95a26e7b38189c77051246cc6b0e102976050af9bf41fbe15b570e02adfe867aae264ad847ac0272e359ec1')

package() {
    cd "$srcdir"

    install -Dm644 ComicRelief.ttf $pkgdir/usr/share/fonts/TTF/ComicRelief.ttf
    install -Dm644 ComicRelief-Bold.ttf $pkgdir/usr/share/fonts/TTF/ComicRelief-Bold.ttf

    install -Dm644 OFL.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
