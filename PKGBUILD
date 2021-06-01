# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=equestria-fonts
pkgver=20140909
pkgrel=2
pkgdesc='Irregular, irreverent typeface based on logos for Hasbro’s My Little Pony Line'
arch=(any)
url='http://www.dafont.com/equestria.font'
license=('custom:Pixel Sagas Freeware Fonts')
provides=(ttf-equestria)
conflicts=(ttf-equestria)
replaces=(ttf-equestria)
source=("$pkgname-$pkgver-$pkgrel.zip::http://img.dafont.com/dl/?f=equestria")
sha256sums=('d12fa57f66fb3e7ff5b5a12e6125bada73355c2d468099faabe5acc16177433a')

package() {
    install -Dpm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dpm644 -t "$pkgdir/usr/share/licenses/$pkgname/" 'Font License.txt'
}
