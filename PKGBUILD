#Maintainer: Abhinav Kuruvila abhinav.kuruvila.joseph@gmail.com
pkgname=abfetch
pkgver=r6.60147a0
pkgrel=1
pkgdesc="A Simple hardware info fetching program"
arch=("any")
url="https://github.com/abhinav3967/$pkgname.git"
license=('GPL3')
depends=('bash')
makedepends=('sudo' 'git')
provides=($pkgname)
backup=('etc/abfetch')
conflicts=('abfetch')
source=("git+https://github.com/abhinav3967/$pkgname.git")
md5sums=('SKIP')
package() {
	mkdir "$pkgdir/usr"
	mkdir "$pkgdir/usr/bin"
	mkdir "$pkgdir/etc/"
	mkdir "$pkgdir/etc/abfetch"
	cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin"
	cp "$srcdir/$pkgname/logo.sf" "$pkgdir/etc/abfetch"
}
