pkgname=equestria-fonts
pkgver=20140909
pkgrel=1
pkgdesc="Based on the package logos for Hasbro's My Little Pony Line. Includes full alphabet, extended characters and punctuation, and Euro."
arch=(any)
url="http://www.dafont.com/equestria.font"
license=("custom:Pixel Sagas Freeware Fonts")
depends=(fontconfig xorg-font-utils)
source=("equestria.zip::http://img.dafont.com/dl/?f=equestria")
md5sums=('5cbfa71684abbfd0c901e16ad931c628')
provides=(ttf-equestria)
conflicts=(ttf-equestria)
replaces=(ttf-equestria)
install="$pkgname.install"

package()
{
  cd "$srcdir"
  find . -name '*.otf' -exec install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/"{} \;
  install -Dm644 "$srcdir/Font License.txt" "$pkgdir/usr/share/licenses/equestria-fonts/Font License.txt"
}
