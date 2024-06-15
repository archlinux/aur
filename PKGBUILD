pkgname="neofetch-extended"
pkgver="7.2.0"
pkgrel="2"
pkgdesc="Neofetch is discounted. This project resumes it!"
arch=('any')
depends=('bash')
license=('MIT')
source=('https://gitlab.com/neofetch-extended/neofetch-extended/-/archive/7.2.0/neofetch-extended-7.2.0.tar.gz')
sha512sums=('SKIP')
provides=('neofetch' 'neofetch-git')
conflicts=('neofetch' 'neofetch-git')

package() {
	tar -xvf $srcdir/neofetch-extended-${pkgver}.tar.gz
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/man/man1
	cp -p $srcdir/neofetch-extended-${pkgver}/neofetch $pkgdir/usr/bin/neofetch
	cp -p $srcdir/neofetch-extended-${pkgver}/neofetch.1 $pkgdir/usr/share/man/man1
	chmod 755 $pkgdir/usr/bin/neofetch
}
