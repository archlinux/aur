pkgname=nosudo
pkgver=0.9
pkgrel=1
pkgdesc="A simple bash script that mimics some of sudo's features"
url='https://github.com/Changaco/nosudo'
arch=('any')
license=('GPL3')
provides=('sudo')
conflicts=('sudo')
source=("https://raw.github.com/Changaco/nosudo/d8b53620259c76aef39ee9fdfec027c2a95fe232/nosudo")
sha1sums=('d45a34fca2373e167403962dc538a7b91f3c0d6e')

package() {
	install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/sudo"
}
