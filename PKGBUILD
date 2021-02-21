# Maintainer: octal <pagliacci at distruzione dot org>
# Contributor: bj33 <bj33 at cock dot li>
pkgname=morse-x
pkgver=20060903
pkgrel=1
pkgdesc="Morse 'practicing' tool for X. Binary release."
arch=('x86_64')
conflicts=('morse-x')
license=('GPL2')
depends=('glibc>=2.4' 'sdl>=1.2.11')
options=('!strip' '!emptydirs')
source_x86_64=("http://mirrors.kernel.org/ubuntu/pool/universe/m/morse-x/morse-x_20060903-0ubuntu1_amd64.deb")
sha512sums_x86_64=('7c4e273977e3a72b97baa9a28fd58644f32aa96f9c5a4e7eca98d6b878fd672679786f28ff13f0ab6d8942a26f3156950bf84db3113fc4b542ef8c4388a2e3ca')

package(){
	tar -xf data.tar.gz
	install -Dm755 "usr/bin/morse-x" "$pkgdir/usr/bin/morse-x"
	install -Dm644 "usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/doc/$pkgname/copyright"
	install -Dm644 "usr/share/man/man1/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
