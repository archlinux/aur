pkgname=pacmantheme
pkgver=20161207
pkgrel=1
pkgdesc="pacmantheme - play the pacman theme song with the motherboard buzzer"
arch=('any')
license=('GPL2')
depends=('ruby')
url="https://raw.githubusercontent.com/andrea993/pacmantheme/master/pacmantheme"
source=("$url")
sha256sums=('27a895aa47bd30eea62dfb33f0e23c55ac3764cabc8f0cfdbba404f6cabec5a0')

package()
{
	mkdir -p "$pkgdir/usr/bin"
	install -m 755  $srcdir/pacmantheme $pkgdir/usr/bin
}



