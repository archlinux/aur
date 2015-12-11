# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=blasphemer-wad
pkgver=0.1.5
pkgrel=1
pkgdesc="A free Heretic game data file (IWAD)"
arch=('any')
url="http://code.google.com/p/blasphemer"
license=('BSD')
replaces=('blasphemer')
source=("https://blasphemer.googlecode.com/files/blasphemer-$pkgver.zip")
sha256sums=('4e49f89584e3a5254e183925c2e6af9764ff3f2a3d1ad7aece066b004af4a1fc')

package() {
    install -d "$pkgdir"/{usr,usr/share,usr/share/doom}
    install -m644 "$srcdir"/BLASPHEM.WAD "$pkgdir"/usr/share/doom/blasphem.wad
    install -D -m644 "$srcdir"/copying "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
